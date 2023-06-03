import 'package:dio/dio.dart';
import 'package:doctor_application/models/register_model.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class RegisterRepository {
  Future<RegisterModel> registerRequest({
    required String username,
    required String password,
    required String mobile,
    required String email,
  }) async {
    var data = FormData.fromMap({
      "username": username,
      "password": password,
      "mobile": mobile,
      "email": email,
    });
    return RegisterModel.fromJson(await DioHelper.postData(
        data: data, endPoint: 'api', query: {'action': 'registerAccount'}));
  }
}
