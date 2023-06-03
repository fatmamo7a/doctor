import 'package:doctor_application/screens/lung/cubit/lung_cubit.dart';
import 'package:doctor_application/screens/lung/cubit/lung_state.dart';
import 'package:doctor_application/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class checklung extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  checklung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lung'),
        backgroundColor: Colors.red[200],
      ),
      body: BlocBuilder<LungCubit, LungState>(
        builder: (ctx, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 0.0),
                child: Stack(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 0.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: Column(
                        children: <Widget>[],
                      )),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 80.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 0.0,
                        ),
                        TextFormField(
                          controller: LungCubit.get(ctx).patientName,
                          decoration: InputDecoration(
                            labelText: ' patient name',
                            prefixIcon: const Icon(Icons.people),
                            border: myfocusborder(),
                            enabledBorder: myfocusborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Enter patient name";
                            } else if (text.length < 3) {
                              return 'Name must be more than 2 charater';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (text) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = RegExp(pattern);
                            if (text!.isEmpty) {
                              return 'Please enter phone number';
                            } else if (!regExp.hasMatch(text)) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          controller: LungCubit.get(ctx).phonenum,
                          decoration: InputDecoration(
                            labelText: 'phone',
                            prefixIcon: const Icon(Icons.phone),
                            border: myfocusborder(),
                            enabledBorder: myfocusborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Enter patient age";
                            } else if (text.length > 3) {
                              return 'age must be Less than 3 charater';
                            } else {
                              return null;
                            }
                          },
                          controller: LungCubit.get(ctx).age,
                          decoration: InputDecoration(
                            labelText: 'age',
                            prefixIcon: const Icon(Icons.person_2_rounded),
                            border: myfocusborder(),
                            enabledBorder: myfocusborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Enter Description";
                            }
                            return null;
                          },
                          controller: LungCubit.get(ctx).description,
                          minLines: 1,
                          maxLines: 20,
                          decoration: InputDecoration(
                            label: const Text('Description'),
                            prefixIcon: const Icon(Icons.description),
                            border: myfocusborder(),
                            enabledBorder: myfocusborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: LungCubit.get(ctx).onUploadRecord,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    size: 40.0,
                                    color: Colors.red[200],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    LungCubit.get(ctx).filePath != null
                                        ? LungCubit.get(ctx)
                                            .filePath!
                                            .path
                                            .split('/')
                                            .last
                                        : 'Upload Lung Record',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        CustomRoundedButton(
                          text: 'Done',
                          load: state is LungLoading ? true : false,
                          textColor: Colors.white,
                          pressed: () {
                            if (_formKey.currentState!.validate()) {
                              LungCubit.get(ctx).checkLung(context);
                            } else {
                              return;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.red[200]!,
          width: 3,
        ));
  }
}
