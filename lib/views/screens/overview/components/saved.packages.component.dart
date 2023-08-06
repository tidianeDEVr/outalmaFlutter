import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outalma/utils/fake.database.dart';
import 'package:outalma/utils/models.dart';
import 'package:outalma/utils/outalma.config.dart';

class SavedPackagesComponent extends StatelessWidget {
  const SavedPackagesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: const Text(
              'Mes colis',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: outalmaGreyTitle,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: (85 * fixturesPackages.length).toDouble(),
            child: ListView.builder(
              itemCount: fixturesPackages.length,
              itemBuilder: (context, index) => SinglePackageTile(
                package: fixturesPackages[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SinglePackageTile extends StatelessWidget {
  final Package package;
  const SinglePackageTile({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 8,
        right: 20,
        top: 8,
        bottom: 8,
      ),
      margin: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: outalmaGreyBorder),
              ),
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 15),
              child: package.deliveryMethod == 'boat'
                  ? SvgPicture.asset("lib/assets/images/ship.svg",
                      height: 5, width: 5, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("lib/assets/images/plane.svg",
                      height: 5, width: 5, fit: BoxFit.scaleDown),
            ),
            RichText(
              text: TextSpan(
                text: "${package.reference} \n",
                style: const TextStyle(
                  color: Colors.black,
                  height: 1.4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                children: const [
                  TextSpan(
                    text: 'Colis déposé chez le transitaire',
                    style: TextStyle(
                      color: outalmaGreyTitle,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ]),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
