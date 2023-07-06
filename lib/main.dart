import 'dart:developer';

import 'package:doctor_application/common/pref_manager.dart';
import 'package:doctor_application/constants.dart';
import 'package:doctor_application/layout/cubit/cubit.dart';
import 'package:doctor_application/layout/cubit/observer.dart';
import 'package:doctor_application/screens/auth/login/bloc/login_cubit.dart';
import 'package:doctor_application/screens/auth/registration/bloc/register_cubit.dart';
import 'package:doctor_application/screens/drawer/profile/cubit/profile_cubit.dart';
import 'package:doctor_application/screens/forget_password/bloc/password_cubit.dart';
import 'package:doctor_application/screens/heart_beat/cubit/heart_beat_cubit.dart';
import 'package:doctor_application/screens/lung/cubit/lung_cubit.dart';
import 'package:doctor_application/screens/murmur/cubit/murmur_cubit.dart';
import 'package:doctor_application/screens/view%20patient/get_users_cubit/get_users_cubit.dart';
import 'package:doctor_application/screens/view%20patient/repository/get%20user%20repository.dart';
import 'package:doctor_application/screens/view%20patient/repository/get%20user%20repository.dart';
import 'package:doctor_application/screens/view%20patient/view_patients.dart';

import 'package:doctor_application/shared/remote/dio_helper.dart';
import 'package:doctor_application/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await PreferenceManager.getInstance()!.getString('token');
  log("Token $token");
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(token: '$token'));

}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({super.key, required this.token});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorCubit>(create: (context) => DoctorCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider<MurmurCubit>(create: (context) => MurmurCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<LungCubit>(create: (context) => LungCubit()),
        BlocProvider<HeartBeatCubit>(create: (context) => HeartBeatCubit()),
        BlocProvider<passwordCubit>(create: (context) => passwordCubit()),
        BlocProvider<GetUsersCubit>(create: (context) => GetUsersCubit(PatientRepository as PatientRepository)),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'doctor app',
        theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),
        ),
        home: ContactsList(),
      ),
    );
  }
}
