import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/overview/components/body.component.dart';
import 'package:outalma/views/screens/overview/components/user.badge.component.dart';
import 'package:outalma/views/screens/search/search.screen.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: outalmaBackground,
        title: const UserBadgeComponent(),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SearchScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: outalmaMainBlue,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
