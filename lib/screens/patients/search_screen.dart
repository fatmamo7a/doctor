import 'dart:convert';

import 'package:doctor_application/screens/patients/user_bloc.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:doctor_application/models/usermodel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => SearchSate();
}

class SearchSate extends State<Search> {
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  List<UserModel> totalUsers = [];

  //to fetch data when get event[search]
  void search(String searchQuery) {
    List<UserModel> searchResult = [];

    userBloc.userController.sink.add(searchResult);

    if (searchQuery.isEmpty) {
      userBloc.userController.sink.add(totalUsers);
      return;
    }
  }

  //http.get()method to fetch Json data from Rest API
  // make antwork request by create afuture that contains aresponse
  Future<void> fetchUsers() async {
    final res = await DioHelper.get(
      endPoint: 'api',
      query: {'action': 'listRecords'},
    );
    //if the server did return a 200 ok response,
    if (res.statusCode == 200) {
      //the response.body contains the data recevied from a http request [url]
      //we convert the response bodey into a Json Map with the dart convert package
      //we convert Json Map object to list by fromJson method
      final Iterable list = res.data["results"];
       totalUsers = list.map((model) => UserModel.fromJson(model)).toList();
       userBloc.userController.sink.add(totalUsers);


    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) => search(text),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3.1, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red[100]!))),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'User',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(child: usersWidget())
          ],
        ),
      ),
    );
  }

  //we use StreamBuilder widget with synchranous data source and display the data on screen
//A builder function that telles flutter what to render ,depending on the state of the Future : Loading , Success or error
  Widget usersWidget() {
    return StreamBuilder(
      stream: userBloc.userController.stream,
      builder:
          (BuildContext buildContext, AsyncSnapshot<List<UserModel>> snapshot) {
        // if (snapshot == null) {
        //   return const CircularProgressIndicator();
        // }
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        leading:
                            Image.network(snapshot.data![index].picturePath),
                        title: Text(
                          snapshot.data![index].username,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        trailing: Text(snapshot.data![index].email)),
                  );
                },
              );
      },
    );
  }
}
