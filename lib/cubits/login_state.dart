import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  String userName = "aa";
  String phoneNumber="123";
  LoginState({required this.userName, required this.phoneNumber});

  LoginState copyWith({String? userName, String? phoneNumber}) {
    return LoginState(userName: userName ?? this.userName, phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userName, phoneNumber];
}
