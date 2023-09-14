import 'package:bloc_example/bloc/signIn/bloc/sign_in_bloc.dart';
import 'package:bloc_example/cubits/login_cubit.dart';
import 'package:bloc_example/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/internet_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SignInBloc(loginCubit: BlocProvider.of<LoginCubit>(context)), //
        ),
        BlocProvider(create: (context) => InternetBloc(), lazy: false)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelocmeScreen(),
      ),
    );
  }
}

/*  BlocProvider(
          create: (context) => LoginCubit(),
          lazy: false,
        ) */