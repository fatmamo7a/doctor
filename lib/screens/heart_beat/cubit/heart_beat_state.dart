import 'dart:io';

abstract class HeartBeatState {}

class HeartBeatInitial extends HeartBeatState {}

class HeartBeatLoading extends HeartBeatState {}

class HeartBeatLoaded extends HeartBeatState {}

class HeartBeatErrorState extends HeartBeatState {
  final String? message;

  HeartBeatErrorState({this.message});
}

class HeartBeatUploadRecord extends HeartBeatState {
  final File file;
  HeartBeatUploadRecord({required this.file});
}
