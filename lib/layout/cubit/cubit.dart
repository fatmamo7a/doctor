import 'package:doctor_application/layout/cubit/state.dart';
import 'package:doctor_application/screens/home/homescreen.dart';
import 'package:doctor_application/screens/home/profile_screen.dart';
import 'package:doctor_application/screens/home/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(LayoutInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = [
    'Home',
    'Profile',
    'Settings',
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_2_outlined,
      ),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }
}
