import 'package:doctor_application/layout/doctor_screen.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'About Us',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor:
            isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.only(
                //   top: MediaQuery.of(context).padding.top,
                //   left: 16,
                //   right: 16,
                // ),
                child: Image.asset(
                  height: 200,
                  'assets/images/about_us.jpg',
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.only(top: 8),
              //   child: Text(
              //     'About Us',
              //     style: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.bold,
              //         color: isLightMode ? Colors.black : Colors.white),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'This application helps doctors diagnose the patient through the sound of the lung and the sound of the heart so that the doctor can know if this patient suffers from murmur or not, and also know if the sound of the heartbeat is normal or not, and also the sound of the lung.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      color: isLightMode ? Colors.black : Colors.white),
                ),
              ),
              // OutlinedButton(
              //   onPressed: () {},
              //   child: const Text(''),
              // ),
              // MaterialButton(
              //   onPressed: () {},
              //   child: const Text(''),
              // )
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Center(
              //       child: Container(
              //         width: 140,
              //         height: 40,
              //         decoration: BoxDecoration(
              //           color: isLightMode
              //               ? Color.fromARGB(255, 216, 171, 145)
              //               : Colors.white,
              //           borderRadius:
              //               const BorderRadius.all(Radius.circular(4.0)),
              //           boxShadow: <BoxShadow>[
              //             BoxShadow(
              //                 color: Colors.grey.withOpacity(0.6),
              //                 offset: const Offset(4, 4),
              //                 blurRadius: 8.0),
              //           ],
              //         ),
              //         child: Material(
              //           color: Colors.transparent,
              //           child: InkWell(
              //             onTap: () {},
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.all(4.0),
              //                 child: Text(
              //                   'Chat with Us',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: isLightMode
              //                         ? Colors.white
              //                         : Colors.black,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
