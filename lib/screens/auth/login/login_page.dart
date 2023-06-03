import 'package:doctor_application/screens/forget_password/forgot_password_page.dart';
import 'package:doctor_application/screens/auth/login/bloc/login_cubit.dart';
import 'package:doctor_application/screens/auth/login/bloc/login_state.dart';
import 'package:doctor_application/screens/auth/registration/registration_page.dart';
import 'package:doctor_application/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
        shadowColor: Colors.grey,
        elevation: 0.0,
        leadingWidth: 100,
        toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            // headline6 is used for setting title's theme
            color: Colors.black87,
            fontSize: 30,
            locale: Locale.fromSubtags(),
          ),
        ).bodyMedium,
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            // headline6 is used for setting title's theme
            color: Colors.black87,
            fontSize: 20,
            locale: Locale.fromSubtags(),
          ),
        ).titleLarge, // default is 56
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<LoginCubit, LoginState>(builder: (ctx, state) {
        return SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
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
                        image: AssetImage("assets/images/img_2.png"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: LoginCubit.get(ctx).username,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      label: const Text(
                        'Username',
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      } else if (value.length < 3) {
                        return 'Name must be more than 2 charater';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: LoginCubit.get(ctx).password,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      label: const Text(
                        '*******',
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'password must be at Least 6 charater';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.black, // set the color to blue
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomRoundedButton(
                    text: 'Login',
                    load: state is LoginLoading ? true : false,
                    textColor: Colors.white,
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginCubit.get(ctx).login(context);
                      } else {
                        return;
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(
                        color: Colors.black, // set the color to red
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.facebook,
                                size: 30,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                // handle Facebook button press
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.twitter,
                                size: 30,
                                color: Colors.lightBlueAccent,
                              ),
                              onPressed: () {
                                // handle Twitter button press
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.google,
                                size: 30,
                                color: Colors.red[200],
                              ),
                              onPressed: () {
                                // handle Google button press
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
