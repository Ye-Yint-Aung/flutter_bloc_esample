import 'package:bloc/bloc.dart';
import 'package:bloc_example/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(userName: '', phoneNumber: '')); //userName: '', phoneNumber: ''

  void onUserNameChanged(String value) {
    emit(state.copyWith(userName: value));
    print("UserName Field Change value : $value");
  }

  void onPhoneNumberChanged(String value) {
    emit(state.copyWith(phoneNumber: value));
    print("PhoneNumber Field Change value : $value");
  }
}
