import 'package:doctor_application/common/theme_helper.dart';
import 'package:doctor_application/screens/category_second/category_second__screen.dart';
import 'package:doctor_application/screens/auth/login/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  ForgotPasswordVerificationPageState createState() =>
      ForgotPasswordVerificationPageState();
}

class ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double headerHeight = 300;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Verification',
          ),
          backgroundColor: Colors.red[200],
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginHomePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  // const Text(
                  //   'Verification',
                  //   style: TextStyle(
                  //       fontSize: 35,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black54),
                  //   // textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const Text(
                    'Enter 4 digit code we sent to your email ',
                    style: TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    // textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        OTPTextField(
                          length: 4,
                          width: 300,
                          fieldWidth: 50,
                          style: const TextStyle(fontSize: 30),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            setState(() {
                              _pinSuccess = true;
                            });
                          },
                        ),
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send pin again in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '0.0',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Sec',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                            color: Colors.red[200],
                          ),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: _pinSuccess
                                ? () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategorySecondScreen()),
                                        (Route<dynamic> route) => false);
                                  }
                                : null,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Verify".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "If you didn't receive a code! ",
                                style: TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                              TextSpan(
                                text: 'Resend',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ThemeHelper().alertDialog(
                                            "Successful",
                                            "Verification code resend successful.",
                                            context);
                                      },
                                    );
                                  },
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[200]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
