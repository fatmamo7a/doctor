import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  static String tag = 'contactlist-page';

  const ContactsList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactsListState();
  }
}

List<Contact> contacts = [
  const Contact(fullName: 'safaa', description: 'this patient suffers from...'),
  const Contact(fullName: 'fatma', description: 'this patient suffers from...'),
  const Contact(
      fullName: 'shimaa', description: 'this patient suffers from...'),
  const Contact(
      fullName: 'shrouk', description: 'this patient suffers from...'),
  const Contact(fullName: 'omnia', description: 'this patient suffers from...'),
  const Contact(fullName: 'esraa', description: 'this patient suffers from...'),
  const Contact(fullName: 'ali', description: 'this patient suffers from...'),
  const Contact(fullName: 'ahmed', description: 'this patient suffers from...'),
  const Contact(
      fullName: 'mohamed', description: 'this patient suffers from...'),
];

class _ContactsListState extends State<ContactsList> {
  TextEditingController searchController = TextEditingController();
  String? filter;

  @override
  void initState() {
    super.initState();
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  // if filter is null or empty returns all data
                  return filter == null || filter == ""
                      ? ListTile(
                          title: Text(
                            contacts[index].fullName,
                          ),
                          subtitle: Text(contacts[index].description),
                          leading: CircleAvatar(
                              backgroundColor: Colors.red[200],
                              child: Text(
                                  style: const TextStyle(color: Colors.white),
                                  contacts[index].fullName.substring(0, 1))),
                          onTap: () => _onTapItem(context, contacts[index]),
                        )
                      : contacts[index]
                              .fullName
                              .toLowerCase()
                              .contains(filter!.toLowerCase())
                          ? ListTile(
                              title: Text(
                                contacts[index].fullName,
                              ),
                              subtitle: Text(contacts[index].description),
                              leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(contacts[index]
                                      .fullName
                                      .substring(0, 1))),
                              onTap: () => _onTapItem(context, contacts[index]),
                            )
                          : Container();
                },
              ),
            ),
          ],
        ));
  }

  void _onTapItem(BuildContext context, Contact post) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tap on " ' - ' + post.fullName),
      ),
    );
  }
}

class Contact {
  final String fullName;
  final String description;

  const Contact({required this.fullName, required this.description});
}
