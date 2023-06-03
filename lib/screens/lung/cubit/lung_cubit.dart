import 'dart:io';

import 'package:doctor_application/models/confirmation_model.dart';
import 'package:doctor_application/models/lung_model.dart';
import 'package:doctor_application/screens/check/confirmation_popup.dart';
import 'package:doctor_application/screens/lung/cubit/lung_state.dart';
import 'package:doctor_application/screens/lung/repository/lung_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LungCubit extends Cubit<LungState> {
  LungCubit() : super(LungInitial());

  TextEditingController patientName = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController description = TextEditingController();
  File? filePath;

  static LungCubit get(context) => BlocProvider.of(context);
  onUploadRecord() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      filePath = File(result.files.single.path!);
      emit(LungLoaded());
    }
  }

  checkLung(context) async {
    if (filePath == null) {
      Fluttertoast.showToast(
        msg: 'Upload Lung Record',
      );
    } else {
      try {
        emit(LungLoading());
        LungModel response = await LungRepository().lungRequest(
            patientName: patientName.text,
            patientPhone: phonenum.text,
            patientAge: age.text,
            file: filePath!,
            description: description.text);
        if (response.status == 'success') {
          emit(LungLoaded());
          var txt =
              response.classification!.split('The predicted class is:').last;
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: ConfirmationPopup(
                        confirmationModel: ConfirmationModel(
                      name: patientName.text,
                      phone: phonenum.text,
                      age: age.text,
                      description: description.text,
                      title: txt,
                    )),
                  ));
          patientName.clear();
          phonenum.clear();
          age.clear();
          description.clear();
          filePath = null;
        } else {
          Fluttertoast.showToast(
            msg: "${response.status}",
          );
          emit(LungErrorState());
        }
      } catch (error) {
        emit(LungErrorState(message: '$error'));
      }
    }
  }
}
