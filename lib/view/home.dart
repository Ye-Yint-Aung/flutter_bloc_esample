import 'package:bloc_example/bloc/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page")),
      body: Center(
        child:
            BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetInitialState) {
              return const Text("Loading");
            } else if (state is InternetLostState) {
              return const Text("NO Internet");
            } else if (state is InternetSuccessState) {
              return const Text("Connected");
            } else {
              return const Text("Check network");
            }
          },
        ),
      ),
    );
  }
}




 /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("NO Internet"),
                backgroundColor: Colors.red,
              )); */