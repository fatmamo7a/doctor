import 'dart:io';

abstract class LungState {}

class LungInitial extends LungState {}

class LungLoading extends LungState {}

class LungLoaded extends LungState {}

class LungErrorState extends LungState {
  final String? message;

  LungErrorState({this.message});
}

class LungUploadRecord extends LungState {
  final File file;
  LungUploadRecord({required this.file});
}
