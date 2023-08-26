import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/shared/components/outalma.white.logo.dart';

class SecurityButton extends StatelessWidget {
  final String label;
  const SecurityButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: outalmaMainBlue,
        // borderRadius: const BorderRadius.only(
        //     bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 4,
              ),
            ),
          ),
          const Positioned(
            top: 17.5,
            right: 30,
            child: WhiteLogo(size: 25),
          )
        ],
      ),
    );
  }
}
