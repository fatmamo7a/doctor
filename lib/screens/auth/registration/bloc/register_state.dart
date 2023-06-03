import 'package:doctor_application/models/register_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final RegisterModel? registerModel;

  RegisterLoaded({this.registerModel});
}

class RegisterErrorState extends RegisterState {
  final String? message;

  RegisterErrorState({this.message});
}
