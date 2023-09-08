import 'package:flutter/material.dart';
import 'package:outalma/utils/fake.database.dart';
import 'package:outalma/views/screens/overview/components/saved.packages.component.dart';

class ResultSearch extends StatefulWidget {
  const ResultSearch({super.key});

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: (85 * fixturesPackages.length).toDouble(),
        child: ListView.builder(
          itemCount: fixturesPackages.length,
          itemBuilder: (context, index) => SinglePackageTile(
            package: fixturesPackages[index],
          ),
        ),
      ),
    );
  }
}
