import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outalma/utils/fake.database.dart';
import 'package:outalma/utils/models.dart';
import 'package:outalma/utils/outalma.config.dart';

Country selectedDepartureCountry = fixtureCountries[0];
Country selectedDestinationCountry = fixtureCountries[1];
late TypeShipment selectedTypeShipment;
int actualStep = 0;
TextEditingController weightController = TextEditingController();
TextEditingController valueController = TextEditingController();
TextEditingController lengthController = TextEditingController();
TextEditingController widthController = TextEditingController();
TextEditingController heightController = TextEditingController();

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
      child: Stack(
        children: [
          Visibility(
            visible: actualStep > 0,
            child: Positioned(
              child: InkWell(
                onTap: () => setState(() {
                  if (actualStep > 0) actualStep = actualStep - 1;
                }),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(left: 12, top: 0),
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
            ),
          ),
          Column(
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
              Column(
                children: [
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: actualStep >= 3
                        ? Container()
                        : Stack(
                            children: <Widget>[
                              Positioned(
                                top: 9,
                                child: Container(
                                  height: 2.5,
                                  width: 250,
                                  color: outalmaStepper,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CheckedStepper(),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: actualStep >= 1
                                        ? const CheckedStepper()
                                        : const UncheckedStepper(),
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: actualStep >= 2
                                        ? const CheckedStepper()
                                        : const UncheckedStepper(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                  actualStep == 0 ? const ChooseCountries() : Container(),
                  actualStep == 1
                      ? ChooseTypeShipment(
                          callbackFunction: _selectTypeShipment)
                      : Container(),
                  actualStep == 2 ? const WeightsAndDimensions() : Container(),
                  actualStep >= 3
                      ? CommandResume(step: actualStep)
                      : Container(),
                ],
              ),
              Visibility(
                visible: actualStep != 1,
                child: InkWell(
                  onTap: () => setState(() {
                    if (actualStep < 3) {
                      actualStep = actualStep + 1;
                      return;
                    }
                    if (actualStep == 3) {
                      _displayLoadingDialog();
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.pop(context);
                        setState(() {
                          actualStep++;
                        });
                      });
                    }
                  }),
                  child: Column(
                    children: [
                      actualStep == 3
                          ? const NextButton(libelle: 'Calculer')
                          : const NextButton(libelle: 'Suivant'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future _displayLoadingDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _selectTypeShipment(TypeShipment ts) {
    setState(() {
      selectedTypeShipment = ts;
      actualStep = actualStep + 1;
    });
  }
}

class CheckedStepper extends StatelessWidget {
  const CheckedStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: outalmaLightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

class UncheckedStepper extends StatelessWidget {
  const UncheckedStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3, color: outalmaStepper),
        borderRadius: BorderRadius.circular(20),
      ),
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text(
            "Pays de départ",
            style: TextStyle(
              color: outalmaGreyTitle,
              fontWeight: FontWeight.w700,
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const CountrySelectorTile(type: 'departure'),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Text(
            "Pays de destination",
            style: TextStyle(
              color: outalmaGreyTitle,
              fontWeight: FontWeight.w700,
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const CountrySelectorTile(type: 'destination'),
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
      height: 50,
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
      child: DropdownSearch<Country>(
        items: fixtureCountries,
        selectedItem: widget.type == 'departure'
            ? selectedDepartureCountry
            : selectedDestinationCountry,
        onChanged: (country) => _selectCountry(widget.type, country!),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlign: TextAlign.center,
          baseStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          dropdownSearchDecoration: InputDecoration(
            icon: Container(
              padding: const EdgeInsets.all(5),
              child: widget.type == 'departure'
                  ? Image.asset(
                      'lib/assets/images/${selectedDepartureCountry.flag}')
                  : Image.asset(
                      'lib/assets/images/${selectedDestinationCountry.flag}'),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  _selectCountry(String type, Country country) {
    setState(() {
      if (type == 'departure') selectedDepartureCountry = country;
      if (type == 'destination') selectedDestinationCountry = country;
    });
  }
}

class ChooseTypeShipment extends StatelessWidget {
  final Function callbackFunction;
  const ChooseTypeShipment({super.key, required this.callbackFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Choisissez un type d\'envoi',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: outalmaGreyTitle,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 15,
          ),
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
            color: outalmaTileBackground,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: outalmaGreyTitle,
            ),
            itemCount: fixturesTypeShipments.length,
            itemBuilder: (context, index) => TypeShipmentTile(
              typeShipment: fixturesTypeShipments[index],
              callbackFunction: callbackFunction,
            ),
          ),
        ),
      ],
    );
  }
}

class TypeShipmentTile extends StatefulWidget {
  final TypeShipment typeShipment;
  final Function callbackFunction;
  const TypeShipmentTile(
      {super.key, required this.typeShipment, required this.callbackFunction});

  @override
  State<TypeShipmentTile> createState() => _TypeShipmentTileState();
}

class _TypeShipmentTileState extends State<TypeShipmentTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.callbackFunction(widget.typeShipment);
      },
      contentPadding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 15,
        right: 15,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            color: outalmaMainBlue,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: SvgPicture.asset("lib/assets/images/plane_white.svg"),
        ),
      ),
      title: Text(
        widget.typeShipment.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: outalmaMainBlue,
        ),
      ),
      subtitle: Text(
        widget.typeShipment.subtitle,
        style: const TextStyle(color: outalmaGreyTitle, fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class WeightsAndDimensions extends StatelessWidget {
  const WeightsAndDimensions({super.key});

  @override
  Widget build(BuildContext context) {
    weightController.text = '10';
    valueController.text = '1000';
    // lengthController
    // widthController
    // heigthController
    return SizedBox(
      height: 220,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Poids du colis',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: outalmaGreyTitle,
                fontStyle: FontStyle.italic,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: outalmaStepper),
                    color: outalmaBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                    controller: weightController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: outalmaStepper),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      width: 50,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'KG',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ))
              ],
            ),
            const Text(
              'La valeur du colis',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: outalmaGreyTitle,
                fontStyle: FontStyle.italic,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: outalmaStepper),
                    color: outalmaBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                    controller: valueController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: outalmaStepper),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      width: 50,
                      height: 50,
                      child: const Center(
                        child: Text(
                          '€',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ))
              ],
            ),
            const Divider(),
            const Text(
              'Longueur',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: outalmaGreyTitle,
                fontStyle: FontStyle.italic,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: outalmaStepper),
                    color: outalmaBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                    controller: lengthController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: outalmaStepper),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      width: 50,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'CM',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ))
              ],
            ),
            const Text(
              'Largeur',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: outalmaGreyTitle,
                fontStyle: FontStyle.italic,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: outalmaStepper),
                    color: outalmaBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                    controller: widthController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: outalmaStepper),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      width: 50,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'CM',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ))
              ],
            ),
            const Text(
              'Hauteur',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: outalmaGreyTitle,
                fontStyle: FontStyle.italic,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: outalmaStepper),
                    color: outalmaBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15),
                    controller: heightController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: outalmaStepper),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    width: 50,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'CM',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommandResume extends StatefulWidget {
  final int step;
  const CommandResume({super.key, required this.step});

  @override
  State<CommandResume> createState() => _CommandResumeState();
}

class _CommandResumeState extends State<CommandResume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          actualStep == 3
              ? const Text(
                  'Résumé de votre commande',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: outalmaGreyTitle,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : const Text(
                  'Votre devis',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: outalmaGreyTitle,
                    fontStyle: FontStyle.italic,
                  ),
                ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: outalmaYellow,
                  border: Border.all(
                    width: 1.5,
                    color: outalmaYellowBorder,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('lib/assets/images/yellow_plane.png',
                              height: 40),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                text: 'Fret aérien \n',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: selectedTypeShipment.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'lib/assets/images/box.png',
                        height: 40,
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: outalmaTileBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/images/takoff.png',
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              text: "${selectedDepartureCountry.name} \n",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              children: const [
                                TextSpan(
                                  text: "Pays de départ",
                                  style: TextStyle(
                                      color: outalmaGreyTitle,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'lib/assets/images/separator.png',
                        height: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/images/landing.png',
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              text: "${selectedDestinationCountry.name} \n",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              children: const [
                                TextSpan(
                                  text: "Pays de destination",
                                  style: TextStyle(
                                      color: outalmaGreyTitle,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: RichText(
                        text: TextSpan(
                          text: "Pois du colis : ${weightController.text} KG",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Valeur du colis : ${valueController.text} €",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actualStep == 4
                  ? Container(
                      decoration: BoxDecoration(
                          color: outalmaCalcBlue,
                          border: Border.all(
                              width: 1, color: outalmaCalcBlueBorder),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      height: 50,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Center(
                            child: Text(
                              '150 €',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 10,
                            child: Image.asset(
                              'lib/assets/images/calculator.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final String libelle;
  const NextButton({super.key, required this.libelle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: outalmaMainBlue,
      child: Stack(children: [
        Center(
          child: Text(
            libelle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
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
