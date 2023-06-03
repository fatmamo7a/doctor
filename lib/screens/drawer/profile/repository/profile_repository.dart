import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor_application/models/profile_model.dart';
import 'package:doctor_application/models/user_info.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class ProfileRepository {
  Future<ProfileModel> uploadProfilePictureRequest(
      {required File profilepic}) async {
    var data = FormData.fromMap({
      "profilepic": await MultipartFile.fromFile(profilepic.path,
          filename: profilepic.path.split('/').last),
    });
    return ProfileModel.fromJson(await DioHelper.postData(
        data: data,
        endPoint: 'api',
        query: {'action': 'uploadProfilePicture'}));
  }

  Future<UserInfoModel> fetchUserData() async {
    return UserInfoModel.fromJson(
      await DioHelper.postData(
        endPoint: 'api',
        query: {'action': 'retrievesessiondata'},
        data: null,
      ),
    );
  }
}
