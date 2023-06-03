import 'package:doctor_application/layout/cubit/cubit.dart';
import 'package:doctor_application/layout/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_drawer.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          //backgroundColor: const Color(0xFFF5CEB8),
          appBar: AppBar(
            backgroundColor: Colors.red[200],
            elevation: 0,
            centerTitle: true,
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          drawer: const DrawerScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            selectedItemColor: Colors.red[200],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
