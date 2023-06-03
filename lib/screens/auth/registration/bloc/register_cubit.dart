import 'package:doctor_application/models/register_model.dart';
import 'package:doctor_application/screens/auth/login/login_page.dart';
import 'package:doctor_application/screens/auth/registration/bloc/register_state.dart';
import 'package:doctor_application/screens/auth/registration/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();

  static RegisterCubit get(context) => BlocProvider.of(context);

  register(context) async {
    try {
      emit(RegisterLoading());
      RegisterModel response = await RegisterRepository().registerRequest(
          password: password.text,
          username: username.text,
          email: email.text,
          mobile: mobile.text);
      if (response.status == 'success') {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoginHomePage()),
        );
        password.clear();
        username.clear();
        email.clear();
        mobile.clear();
        emit(RegisterLoaded(registerModel: response));
      } else {
        Fluttertoast.showToast(
          msg: "${response.status}",
        );
        emit(RegisterErrorState());
      }
    } catch (e) {
      emit(RegisterErrorState(message: '$e'));
    }
  }
}
