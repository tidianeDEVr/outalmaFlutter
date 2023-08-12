import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/overview/components/new.package.component.dart';
import 'package:outalma/views/screens/overview/components/saved.packages.component.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: outalmaBackground,
      width: double.infinity,
      height: double.infinity,
      child: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NewPackageComponent(),
              SavedPackagesComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
