




import 'package:equatable/equatable.dart';


abstract class SignInState extends Equatable {}

class SignInInitialState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoadingState extends SignInState {
  @override
  List<Object?> get props => [];
}

//Success

class SignInSuccessState extends SignInState {
  // dynamic data;
  String? userName = "aa";
  String? phoneNumber = "123";
  SignInSuccessState({this.userName, this.phoneNumber});
  @override
  List<Object?> get props => [userName, phoneNumber];
}

//Error

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
