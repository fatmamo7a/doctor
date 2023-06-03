import 'dart:io';

import 'package:doctor_application/models/user_info.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserInfoModel info;

  ProfileLoaded({required this.info});
}

class ProfileErrorState extends ProfileState {
  final String? message;

  ProfileErrorState({this.message});
}

class ProfilePic extends ProfileState {
  final File file;
  ProfilePic({required this.file});
}
