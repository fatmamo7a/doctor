import 'package:dio/dio.dart';
import 'package:doctor_application/screens/forget_password/bloc/password_cubit.dart';
import 'package:doctor_application/screens/forget_password/bloc/password_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/rounded_btn.dart';
import '../auth/login/login_page.dart';
import 'forgot_password_verification_page.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    double headerHeight = 300;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Text('Forgot Password'),
      ),
      backgroundColor: Colors.grey[300],
        body: BlocBuilder<passwordCubit, passwordState>(builder: (ctx, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 300,
              decoration: BoxDecoration(
                /* border: Border.all(
                color: Colors.grey,
                width: 5,
              ),*/
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange[100]!.withOpacity(0.5),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: const Offset(4, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/images/Reset password-pana.png"),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(

                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Forgot Password?',
                          //   style: TextStyle(
                          //       fontSize: 35,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black54),
                          //   // textAlign: TextAlign.center,
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'Enter the email address associated with your account.',
                          //   style: TextStyle(
                          //       // fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black54),
                          //   // textAlign: TextAlign.center,
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'We will email you a verification code to check your authenticity.',
                            style: TextStyle(
                              color: Colors.black38,
                              // fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.red[200]),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              label: const Text('Email'),
                            ),
                            // decoration: ThemeHelper().textInputDecoration(
                            //     "Email", "Enter your email"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Email can't be empty";
                              } else if (!RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                              CustomRoundedButton(
                                text: 'Send',
                                load: state is PasswordLoading ? true : false,
                                textColor: Colors.white,
                                pressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    passwordCubit.get(ctx).password(context);
                                  }
                                  else {
                                    return ;
                                  }
                                },
                              ),


                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text.rich(
          TextSpan(
                children: [
                  const TextSpan(text: "Remember your password? "),
                          TextSpan(
                            text: 'Login',
                           recognizer: TapGestureRecognizer()
                               ..onTap = () {
                                 Navigator.push(
                                  context,
                                 MaterialPageRoute(
                                     builder: (context) => const LoginHomePage()),
                                 );
                              },
                            style: TextStyle(
                            color: Colors
                                  .deepOrange[300], // set the color to blue
                            ),
                          ),
                         ],
                      ),
                     ),
                  ],
                ),
              ),
            ),
          ],

        ),


          );
        }),
    );
  }
}




