import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WhiteLogo extends StatelessWidget {
  final double size;
  const WhiteLogo({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "lib/assets/images/white_logo.svg",
      width: size,
    );
  }
}
