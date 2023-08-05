import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WhiteLogo extends StatelessWidget {
  const WhiteLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("lib/assets/images/white_logo.svg");
  }
}
