import 'dart:io';

abstract class MurmurState {}

class MurmurInitial extends MurmurState {}

class MurmurLoading extends MurmurState {}

class MurmurLoaded extends MurmurState {}

class MurmurErrorState extends MurmurState {
  final String? message;

  MurmurErrorState({this.message});
}

class MurmurUploadRecord extends MurmurState {
  final File file;
  MurmurUploadRecord({required this.file});
}
