import 'dart:async';
import 'package:doctor_application/screens/patients/Bloc.dart';
import 'package:doctor_application/models/usermodel.dart';

class UserBloc extends Bloc {
  final userController = StreamController<List<UserModel>>.broadcast();
  @override
  void dispose() {
    userController.close();
  }
}

UserBloc userBloc = UserBloc();
