import 'package:doctor_application/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/patient widget.dart';
import 'get_users_cubit/get_users_cubit.dart';

class ContactsList extends StatefulWidget {
  static String tag = 'contactlist-page';

  const ContactsList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactsListState();
  }
}


class _ContactsListState extends State<ContactsList> {
  late List<dynamic>allPatients;
  TextEditingController searchController = TextEditingController();
  String? filter;

  @override
  void initState() {
    super.initState();
    allPatients = BlocProvider.of<GetUsersCubit>(context).getAllusers();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget buildBlocwidget(){
   return BlocBuilder<GetUsersCubit, GetUsersState>(builder: (ctx, state) {
     if (state is UsersLoaded) {
       allPatients = (state).Patients;
       return buildloadedpatientsListwidgets();
     }

     else {
       return showLoadingIndicator();
     }
   },
   );
  }
  Widget showLoadingIndicator(){
    return Center(child: CircularProgressIndicator(
      color: Colors.amberAccent,
    ),);
  }

  Widget buildloadedpatientsListwidgets(){
    return SingleChildScrollView(
        child: Container(
            color: Colors.black12,
            child: Column(
              children: [
                buildpatientsList(),

              ],)));
  }
  Widget buildpatientsList(){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 1/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allPatients.length,
        itemBuilder: (ctx,index){
      return patientItem(user: allPatients[index],);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[200],
            centerTitle: true,
            shadowColor: const Color.fromARGB(255, 217, 140, 140),
            title: const Text('patients',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
      body:buildBlocwidget(),



    );

        }

    }





  void _onTapItem(BuildContext context, Contact post) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tap on " ' - ' + post.fullName),
      ),
    );
  }


class Contact {
  final String fullName;
  final String description;

  const Contact({required this.fullName, required this.description});
}
