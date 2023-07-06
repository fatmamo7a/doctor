import 'dart:convert';

import 'package:dio/dio.dart';

import '../../common/pref_manager.dart';
import '../../core/api/interceptors.dart';

class DioHelper {
  static Dio? dio;
  //This object from Dio is the one that'll make me deal with APIs
  // But it's still empty

  //Create dio object and fill it by calling it in main every time app runs

  static init() async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
    };

    var token = await PreferenceManager.getInstance()!.getString('token');

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = token;
    }

    dio = Dio(BaseOptions(
      baseUrl: 'http://160.20.146.238/', //   API
      headers: headers,
    ));
    dio?.interceptors.add(AppInterceptors());
    dio?.interceptors.add(LogInterceptor());
  }

  //HTTP GET METHOD : Retrieving data from a server.
  static Future<Response> get({
    required endPoint,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    // Path is the method url from api link
    //Review comment in post
    return await dio!.get(
      endPoint,
      queryParameters: query,
    );
  }

  //HTTP POST METHOD  - To send data to api
  static Future<Map<String, dynamic>> postData({
    required endPoint,
    required data,
    Map<String, dynamic>? query,
  }) async {
    //When we want to post data we may need to send headers .. This is how to do it
    // lang can be changed so is token, that's why we didn't put them in BaseOptions above
    // like 'Application-Content'

    Response response = await dio!.post(
      endPoint,
      data: data,
      queryParameters: query,
    );

    return response.data;
  }
}
