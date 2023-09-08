import 'package:flutter/material.dart';
import 'package:outalma/utils/fake.database.dart';
import 'package:outalma/utils/models.dart';
import 'package:outalma/utils/outalma.config.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({super.key});

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: (38 * fixturesPackages.length).toDouble(),
        child: ListView.builder(
          itemCount: fixturesPackages.length,
          itemBuilder: (context, index) => SingleSearchTile(
            package: fixturesPackages[index],
          ),
        ),
      ),
    );
  }
}

class SingleSearchTile extends StatelessWidget {
  final Package package;
  const SingleSearchTile({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 20),
        child: Row(
          children: [
            const Icon(
              Icons.history,
              color: outalmaGreyTitle,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Text(
                package.reference,
                style: const TextStyle(
                  fontSize: 20,
                  color: outalmaGreyTitle,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: outalmaGreyTitle,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
