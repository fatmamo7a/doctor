import 'package:dio/dio.dart';

import 'package:doctor_application/shared/remote/dio_helper.dart';
import 'package:doctor_application/models/forgotpassword.dart';

class PasswordRepository {
  Future<forgotpassword> passwordRequest(
      { required String email}) async {
    var data = FormData.fromMap({
      "email": email,

    });
    return forgotpassword.fromJson(await DioHelper.postData(
        data: data, endPoint: 'api', query: {'action': 'forgotPasswordRequest'}));
  }
}
