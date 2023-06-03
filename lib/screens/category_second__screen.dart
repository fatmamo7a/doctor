import 'package:flutter/material.dart';

final TextEditingController _controller = TextEditingController();

class CategorySecondScreen extends StatelessWidget {
  const CategorySecondScreen({super.key});

  //static const screenRoute = '/category-pages';

  get names => null;

  get username => null;

  get email => null;

  get password => null;

  get phoneNum => null;

  get age => null;

  get description => null;
//final String categoryid;
//final String categorytitle;
//categorysecondscreen(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add patient'),
        backgroundColor: const Color(0xFFF5CEB8),
      ),
      body: SingleChildScrollView(
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
              padding:
                  const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 0.0,
                  ),
                  TextField(
                    controller: names,
                    decoration: InputDecoration(
                      labelText: ' patient name',
                      prefixIcon: const Icon(Icons.people),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                      focusedBorder: myFocusBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: phoneNum,
                    decoration: InputDecoration(
                      labelText: 'phone',
                      prefixIcon: const Icon(Icons.phone),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                      focusedBorder: myFocusBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: age,
                    decoration: InputDecoration(
                      labelText: 'age',
                      prefixIcon: const Icon(Icons.person_2_rounded),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                      focusedBorder: myFocusBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: description,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(50.0),
                      labelText: 'Description',
                      prefixIcon: const Icon(Icons.description),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                      focusedBorder: myFocusBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2BEA1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20.0),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    child: const Text('Done'),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  OutlineInputBorder myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color(0xFFF2BEA1),
          width: 3,
        ));
  }

  OutlineInputBorder myFocusBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 182, 47, 110),
          width: 3,
        ));
  }
}
