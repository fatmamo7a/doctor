import 'package:doctor_application/common/pref_manager.dart';
import 'package:doctor_application/layout/doctor_screen.dart';
import 'package:doctor_application/models/forgotpassword.dart';
import 'package:doctor_application/screens/forget_password/bloc/password_state.dart';
import 'package:doctor_application/screens/forget_password/repository/password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../forgot_password_verification_page.dart';

class passwordCubit extends Cubit<passwordState> {
  passwordCubit() : super(PasswordInitial());


  TextEditingController email = TextEditingController();

  static passwordCubit get(context) => BlocProvider.of(context);

  password(context) async {
    try {

      forgotpassword response = (await PasswordRepository()
          .passwordRequest( email: 'email')) as forgotpassword;

      print("response.status ${response.status}");

      if (response.status == 'success') {
        PreferenceManager.getInstance()!.saveString;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  const ForgotPasswordVerificationPage()));

      } else {
        Fluttertoast.showToast(
          msg: "${response.status}",
        );
        emit(PasswordErrorState());
      }
    } catch (e) {
      print(e);
      emit(PasswordErrorState(message: '$e'));
    }
  }
}
