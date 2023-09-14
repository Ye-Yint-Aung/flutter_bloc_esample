abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  String? userNameValue;
  String? phoneNumberValue;

  SignInTextChangeEvent(this.userNameValue, this.phoneNumberValue);
}

class SignInSubmittedEvent extends SignInEvent {
  String? userName;
  String? phoneNumber;

  SignInSubmittedEvent({this.userName, this.phoneNumber});
}
