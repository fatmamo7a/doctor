import 'package:doctor_application/models/forgotpassword.dart';


abstract class passwordState {}

class PasswordInitial extends passwordState {}

class PasswordLoading extends passwordState {}


class PasswordErrorState extends passwordState {
  final String? message;

  PasswordErrorState({this.message});
}