import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/overview/overview.screen.dart';
import 'package:outalma/views/screens/search/components/recent.search.component.dart';
import 'package:outalma/views/screens/search/components/result.search.component.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      color: outalmaBackground,
      width: double.infinity,
      height: double.infinity,
      child: const SafeArea(
        child: Column(
          children: [
            TopSearchBar(),
            RecentSearch(),
            ResultSearch(),
          ],
        ),
      ),
    );
  }
}

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const OverviewScreen(),
              ),
            );
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              border: Border.all(color: outalmaStepper, width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          height: 50,
          padding: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            color: outalmaTileBackground,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Entrez le code de suivi de votre colis',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: outalmaMainBlue,
                )),
          ),
        )
      ],
    );
  }
}
