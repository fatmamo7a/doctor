import 'package:doctor_application/screens/heart_beat/check_heart_beat.dart';
import 'package:doctor_application/screens/murmur/check_murmur.dart';
import 'package:doctor_application/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../patients/search_screen.dart';
import '/screens/view_patients.dart';
import '../lung/lung_check.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.26,
            decoration: BoxDecoration(
              color: Colors.red[200],
              image: const DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
            alignment: Alignment
                .topRight, // تحديد موضع الـ Container داخل الـ parent widget
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          height: 180.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.brown.withOpacity(.2),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 150,
                            bottom: 50,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'MEDI',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Text(
                                    'CO',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                child: Text(
                                  'Changing the way to diagnose medical sounds..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Image(
                        height: 160,
                        width: 150,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/doc.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      InkWell(
                        child: const CategoryCard(
                          title: "check murmur",
                          svgSrc: "assets/icons/murmur.svg",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Checkmurmur();
                            }),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return checklung();
                            }),
                          );
                        },
                        child: const CategoryCard(
                          title: "lung",
                          svgSrc: "assets/icons/lungs.svg",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return CheckHeartBeat();
                            }),
                          );
                        },
                        child: const CategoryCard(
                          title: "check heartbeat",
                          svgSrc: "assets/icons/heart_rate.svg",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Search();
                            }),
                          );
                        },
                        child: const CategoryCard(
                          title: "view patients",
                          svgSrc: "assets/icons/notes.svg",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
