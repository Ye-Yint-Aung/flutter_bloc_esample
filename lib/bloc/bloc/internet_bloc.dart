import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/bloc/internet_event.dart';
import 'package:bloc_example/bloc/bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubsctiption;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetSuccessEvent>((event, emit) => emit(InternetSuccessState()));

    connectivitySubsctiption = _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
          add(InternetSuccessEvent());
        } else {
          add(InternetLostEvent());
        }
      },
    );
  }
  @override
  Future<void> close() {
    connectivitySubsctiption?.cancel();
    return super.close();
  }
}
