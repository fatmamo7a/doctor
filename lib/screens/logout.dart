import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_message),
                  ElevatedButton(
                      onPressed: () => _logout(context),
                      child: const Text('Logout')),
                ],
              ),
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
