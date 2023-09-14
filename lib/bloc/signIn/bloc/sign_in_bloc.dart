import 'package:bloc_example/bloc/signIn/bloc/sign_in_event.dart';
import 'package:bloc_example/bloc/signIn/bloc/sign_in_state.dart';
import 'package:bloc_example/cubits/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.loginCubit}) : super(SignInLoadingState()) {
    
    on<SignInSubmittedEvent>(signIn);

    on<SignInTextChangeEvent>(
      (event, emit) {
        if (event.userNameValue == "") {
          emit(SignInErrorState("Fill UserName"));
        } else if (event.phoneNumberValue == "") {
          emit(SignInErrorState("File Phone Number"));
        } else {
          emit(SignInSuccessState());
        }
      },
    );
  }

  LoginCubit loginCubit;

  void signIn(SignInSubmittedEvent event, emit) {
    emit(SignInLoadingState());
    String userName;
    String phoneNumber;
    userName = loginCubit.state.userName;
    phoneNumber = loginCubit.state.phoneNumber;
    emit(SignInSuccessState());
    print("Submit changed value: $userName and $phoneNumber ");
  }
}
