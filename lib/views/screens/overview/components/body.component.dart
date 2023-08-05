import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/overview/components/new.package.component.dart';
import 'package:outalma/views/screens/overview/components/saved.packages.component.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: outalmaBackground,
        width: double.infinity,
        child: const SingleChildScrollView(
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
