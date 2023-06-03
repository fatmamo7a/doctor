import 'package:dio/dio.dart';
import 'package:doctor_application/models/login_model.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class LoginRepository {
  Future<LoginModel> loginRequest(
      {required String username, required String password}) async {
    var data = FormData.fromMap({
      "username": username,
      "password": password,
    });
    return LoginModel.fromJson(await DioHelper.postData(
        data: data, endPoint: 'api', query: {'action': 'login'}));
  }
}
