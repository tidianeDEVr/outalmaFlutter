import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/widget/flutter_single_select.dart';
import 'package:outalma/utils/fake.database.dart';
import 'package:outalma/utils/models.dart';
import 'package:outalma/utils/outalma.config.dart';

Country selectedDepartureCountry = fixtureCountries[0];
Country selectedDestinationCountry = fixtureCountries[1];

class ModalPackageComponent extends StatefulWidget {
  const ModalPackageComponent({super.key});

  @override
  State<ModalPackageComponent> createState() =>
      _ModalNewPackageComponentState();
}

class _ModalNewPackageComponentState extends State<ModalPackageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const Stepper(),
          const ChooseCountries(),
          const NextButton()
        ],
      ),
    );
  }
}

class Stepper extends StatefulWidget {
  const Stepper({super.key});

  @override
  State<Stepper> createState() => _StepperState();
}

class _StepperState extends State<Stepper> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "stepper",
      style: TextStyle(color: Colors.black),
    );
  }
}

class ChooseCountries extends StatefulWidget {
  const ChooseCountries({super.key});

  @override
  State<ChooseCountries> createState() => _ChooseCountriesState();
}

class _ChooseCountriesState extends State<ChooseCountries> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Pays de départ",
          style: TextStyle(
            color: outalmaGreyTitle,
            fontWeight: FontWeight.w700,
            fontSize: 17,
            fontStyle: FontStyle.italic,
          ),
        ),
        CountrySelectorTile(type: 'departure'),
        Text(
          "Pays de destination",
          style: TextStyle(
            color: outalmaGreyTitle,
            fontWeight: FontWeight.w700,
            fontSize: 17,
            fontStyle: FontStyle.italic,
          ),
        ),
        CountrySelectorTile(type: 'destination'),
      ],
    );
  }
}

class CountrySelectorTile extends StatefulWidget {
  final String type;
  const CountrySelectorTile({super.key, required this.type});

  @override
  State<CountrySelectorTile> createState() => _CountrySelectorTileState();
}

class _CountrySelectorTileState extends State<CountrySelectorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
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
      child: CustomSingleSelectField<Country>(
        selectedItemColor: Colors.blue,
        initialValue: widget.type == 'departure'
            ? selectedDepartureCountry
            : selectedDestinationCountry,
        items: fixtureCountries,
        title: widget.type == "departure"
            ? "Pays de départ"
            : "Pays de destination",
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 5),
          suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
          prefix: Container(
            margin: const EdgeInsets.only(left: 20, right: 30),
            child: widget.type == 'departure'
                ? Image.asset(
                    "lib/assets/images/${selectedDepartureCountry.flag}",
                    width: 30,
                    height: 30,
                  )
                : Image.asset(
                    "lib/assets/images/${selectedDestinationCountry.flag}",
                    width: 30,
                    height: 30,
                  ),
          ),
          fillColor: Colors.white,
        ),
        onSelectionDone: (value) {
          _selectCountry(widget.type, value);
          setState(() {});
        },
        itemAsString: (item) => item.name,
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: outalmaMainBlue,
      child: const Stack(children: [
        Center(
          child: Text(
            "Suivant",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          top: 26,
          right: 35,
          child: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}

_selectCountry(String type, Country country) {
  if (type == 'departure') selectedDepartureCountry = country;
  if (type == 'destination') selectedDestinationCountry = country;
}
