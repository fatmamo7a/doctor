import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function? press;
  const CategoryCard({
    super.key,
    required this.svgSrc,
    required this.title,
    this.press,
    Image? child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const Spacer(),
                SvgPicture.asset(svgSrc, height: 80, color: Colors.red[200]),
                const Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
