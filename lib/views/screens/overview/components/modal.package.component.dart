import 'package:flutter/material.dart';

class ModalPackageComponent extends StatefulWidget {
  const ModalPackageComponent({super.key});

  @override
  State<ModalPackageComponent> createState() => _ModalPackageComponentState();
}

class _ModalPackageComponentState extends State<ModalPackageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 600,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
