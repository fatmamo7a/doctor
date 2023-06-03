import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor_application/models/heart_beat_model.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class HeartBeatRepository {
  Future<HeartBeatModel> heartBeatRequest({
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
    return HeartBeatModel.fromJson(await DioHelper.postData(
        data: data, endPoint: 'api', query: {'action': 'importRecord2'}));
  }
}
