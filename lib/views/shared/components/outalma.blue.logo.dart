import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueLogo extends StatelessWidget {
  final double size;
  const BlueLogo({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "lib/assets/images/blue_logo.svg",
      width: size,
    );
  }
}
