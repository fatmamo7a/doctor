import 'package:doctor_application/models/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModel? loginModel;

  LoginLoaded({this.loginModel});
}

class LoginErrorState extends LoginState {
  final String? message;

  LoginErrorState({this.message});
}
