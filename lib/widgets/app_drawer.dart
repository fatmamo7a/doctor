import 'package:doctor_application/screens/drawer/profile/profile_drawer.dart';
import 'package:doctor_application/screens/drawer/setting_drawer.dart';
import 'package:flutter/material.dart';
import '../screens/logout.dart';
import '/screens/about_us.dart';
import '/screens/feed_ back.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Color.fromARGB(255, 240, 164, 168),
      ),
      "title": "Profile",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.feedback,
        color: Color.fromARGB(255, 240, 164, 168),
      ),
      "title": "Feedback",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.help,
        color: Color.fromARGB(255, 240, 164, 168),
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Color.fromARGB(255, 240, 164, 168),
      ),
      "title": "Settings",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color.fromARGB(255, 240, 164, 168),
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Drawer(
              backgroundColor: Colors.white,
              elevation: 20.0,
              child: ListView(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.channelfutures.com/files/2019/10/Focus-877x432.jpg"),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Text(
                        "alax",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      "",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 15.0,
                      end: 15.0,
                    ),
                    child: Divider(
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...drawerMenuListname.map((sideMenuData) {
                    return ListTile(
                      leading: sideMenuData['leading'],
                      title: Text(
                        sideMenuData['title'],
                      ),
                      trailing: sideMenuData['trailing'],
                      onTap: () {
                        Navigator.pop(context);
                        if (sideMenuData['action_id'] == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfileDrawer(),
                            ),
                          );
                        } else if (sideMenuData['action_id'] == 2) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FeedbackScreen(),
                            ),
                          );
                        } else if (sideMenuData['action_id'] == 3) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AboutUs(),
                            ),
                          );
                        } else if (sideMenuData['action_id'] == 4) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingsDrawer(),
                            ),
                          );
                        } else if (sideMenuData['action_id'] == 5) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LogoutPage(),
                            ),
                          );
                        }
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
