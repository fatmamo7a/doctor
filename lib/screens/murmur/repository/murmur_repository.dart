import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor_application/models/murmur_model.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class MurmurRepository {
  Future<MurmurModel> murmurRequest({
    required String patientName,
    required String patientPhone,
    required String patientAge,
    required File file,
    required String description,
  }) async {
    var data = FormData.fromMap({
      "patientName": patientName,
      "patientPhone": patientPhone,
      "patientAge": patientAge,
      "record": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
      "description": description,
    });
    return MurmurModel.fromJson(
      await DioHelper.postData(
          data: data, endPoint: 'api', query: {'action': 'importRecord1'}),
    );
  }
}
