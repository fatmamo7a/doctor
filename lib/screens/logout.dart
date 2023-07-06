import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/rounded_btn.dart';
import 'auth/login/login_page.dart';

class LogoutPage extends StatefulWidget {
  static String tag = 'logout-page';

  const LogoutPage({super.key});

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  bool _isLoading = false;
  String _message = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text('Logout', style: TextStyle(color: Colors.white)),
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
      body: Column(
        children: <Widget>[


          Container(
            margin: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepOrange[100]!.withOpacity(0.5),
                  spreadRadius: 150,
                  blurRadius: 160,
                  offset: const Offset(4, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage("assets/images/logout.png"),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Center(

            child: _isLoading
                ? const CircularProgressIndicator()
                : Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Are you sure you want to logout?'
                      ' Logging out'
            ' will end your current session and !'
                      ,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
                CustomRoundedButton(
                  text: 'Logout',
                  textColor: Colors.white,
                  pressed: () => _logout(context),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }


  Future<void> _logout(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      Uri.parse('http://160.20.146.238/api?action=logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      await prefs.remove('token');

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginHomePage()),
            (route) => false);
      }
    } else {
      final data = json.decode(response.body);
      setState(() {
        _message = data['message'];
      });
    }
  }
}
