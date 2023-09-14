// ignore_for_file: prefer_const_constructors

import 'package:bloc_example/cubits/login_cubit.dart';
import 'package:bloc_example/cubits/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signIn/bloc/sign_in_bloc.dart';
import '../bloc/signIn/bloc/sign_in_event.dart';
import '../bloc/signIn/bloc/sign_in_state.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LOGIN")),
      body: BlocListener<SignInBloc, SignInState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          print("listen state ;;;;> $state");
          if (state is SignInLoadingState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: Text("Error", textAlign: TextAlign.center)),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text("Retry"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }
          if (state is SignInErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: Text("Error", textAlign: TextAlign.center)),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text("Retry"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }
          if (state is SignInSuccessState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Center(child: Text("Success", textAlign: TextAlign.center)),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }
        },
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 80, bottom: 20),
            child: Text(
              "SIGN IN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: userNameField(nameController: nameController),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: phoneNumberField(phoneController: phoneController),
          ),
          ElevatedButton(
            child: const Text("SUBMIT"),
            onPressed: () {
              context.read<SignInBloc>().add(SignInSubmittedEvent());
            },
          )
        ]),
      ),
    );
  }
}

class phoneNumberField extends StatelessWidget {
  const phoneNumberField({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          keyboardType: TextInputType.phone,
          controller: phoneController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone Number',
          ),
          onChanged: (value) => context.read<LoginCubit>().onPhoneNumberChanged(value),
        );
      },
    );
  }
}

class userNameField extends StatelessWidget {
  const userNameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'UserName',
          ),
          onChanged: (value) => context.read<LoginCubit>().onUserNameChanged(value),
        );
      },
    );
  }
}
