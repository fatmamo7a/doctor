import 'package:doctor_application/screens/auth/login/login_page.dart';
import 'package:doctor_application/screens/auth/registration/bloc/register_cubit.dart';
import 'package:doctor_application/screens/auth/registration/bloc/register_state.dart';
import 'package:doctor_application/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0.0,
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            // headline6 is used for setting title's theme
            color: Colors.white,
            fontSize: 20,
            locale: Locale.fromSubtags(),
          ),
        ).titleLarge,
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<RegisterCubit, RegisterState>(builder: (ctx, state) {
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
                  const SizedBox(height: 22.0),
                  TextFormField(
                    controller: RegisterCubit.get(ctx).username,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Username',
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
                  const SizedBox(height: 22.0),
                  TextFormField(
                      controller: RegisterCubit.get(ctx).password,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[200]),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: '*******',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'password must be at Least 6 charater';
                        }
                        return null;
                      }),
                  const SizedBox(height: 22.0),
                  TextFormField(
                    controller: RegisterCubit.get(ctx).email,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Alax@gmail.com',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regExp = RegExp(pattern);
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: RegisterCubit.get(ctx).mobile,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'mobile',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (text) {
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = RegExp(pattern);
                      if (text!.isEmpty) {
                        return 'Please enter phone number';
                      } else if (!regExp.hasMatch(text)) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  CustomRoundedButton(
                    text: 'Register',
                    load: state is RegisterLoading ? true : false,
                    textColor: Colors.white,
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        RegisterCubit.get(ctx).register(context);
                      } else {
                        return;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginHomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Have an account? Sign In',
                      style: TextStyle(
                        color: Colors.black, // set the color to red
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                      const SizedBox(width: 5),
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
                      const SizedBox(width: 5),
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
