import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueLogo extends StatelessWidget {
  const BlueLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // return Image.asset("lib/assets/images/blue_logo.svg");
    return SvgPicture.asset("lib/assets/images/blue_logo.svg");
  }
}
