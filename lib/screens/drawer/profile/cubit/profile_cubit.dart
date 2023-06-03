import 'dart:developer';
import 'dart:io';
import 'package:doctor_application/models/user_info.dart';
import 'package:doctor_application/screens/drawer/profile/cubit/profile_state.dart';
import 'package:doctor_application/screens/drawer/profile/repository/profile_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../models/profile_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  File? picturePath;
  static ProfileCubit get(context) => BlocProvider.of(context);
  onUploadRecord() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      picturePath = File(result.files.single.path!);
      try {
        ProfileModel response = await ProfileRepository()
            .uploadProfilePictureRequest(
                profilepic: File(result.files.single.path!));
        if (response.message == 'success') {
          emit(ProfilePic(file: picturePath!));
        }
      } catch (error) {
        log('Error $error');
      }
    }
  }

  userInfo() async {
    try {
      emit(ProfileLoading());
      UserInfoModel response = await ProfileRepository().fetchUserData();
      if (response.status == 'success') {
        emit(ProfileLoaded(info: response));
      } else {
        Fluttertoast.showToast(
          msg: "${response.status}",
        );
        emit(ProfileErrorState());
      }
    } catch (e) {
      emit(ProfileErrorState(message: '$e'));
    }
  }
}
