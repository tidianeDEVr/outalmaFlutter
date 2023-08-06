import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outalma/views/screens/overview/components/modal.new.package.component.dart';
import 'package:outalma/views/shared/components/outalma.blue.logo.dart';
import 'package:outalma/views/shared/components/outalma.white.logo.dart';

import '../../../../utils/outalma.config.dart';

class NewPackageComponent extends StatefulWidget {
  const NewPackageComponent({super.key});

  @override
  State<NewPackageComponent> createState() => _NewPackageComponentState();
}

class _NewPackageComponentState extends State<NewPackageComponent> {
  var selectedDeliveryMethod = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      padding: const EdgeInsets.only(
        top: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const BlueLogo(),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Text(
              'Comment voulez-vous \n envoyer votre colis ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () => _selectDeliveryMethod('plane'),
                    child: AnimatedContainer(
                      width: 140,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(20),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: outalmaBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: selectedDeliveryMethod == 'plane'
                            ? Border.all(
                                color: outalmaLightBlue,
                                width: 1,
                              )
                            : Border.all(
                                color: Colors.grey,
                                width: .5,
                              ),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "lib/assets/images/airplane.svg",
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: const Divider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          const Text(
                            'Par avion',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: selectedDeliveryMethod == 'plane'
                        ? const CheckedMethodIcon()
                        : const UncheckedMethodIcon(),
                  )
                ],
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () => _selectDeliveryMethod('boat'),
                    child: AnimatedContainer(
                      width: 140,
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(20),
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: outalmaBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: selectedDeliveryMethod == 'boat'
                            ? Border.all(
                                color: outalmaLightBlue,
                                width: 1,
                              )
                            : Border.all(
                                color: Colors.grey,
                                width: .5,
                              ),
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset("lib/assets/images/boat.svg"),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: const Divider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          const Text(
                            'Par bateau',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: selectedDeliveryMethod == 'boat'
                        ? const CheckedMethodIcon()
                        : const UncheckedMethodIcon(),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () => _displayBottomSheet(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedDeliveryMethod == ''
                          ? outalmaMainBlue.withOpacity(.5)
                          : outalmaMainBlue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    height: 70,
                    child: const Center(
                      child: Text(
                        'DEVIS GRATUIT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 3.8,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 50,
                right: 60,
                child: WhiteLogo(),
              )
            ],
          ),
        ],
      ),
    );
  }

  _displayBottomSheet(BuildContext context) {
    if (selectedDeliveryMethod == "") return;
    showModalBottomSheet(
      context: context,
      backgroundColor: outalmaBackgroundModal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (builder) => const ModalPackageComponent(),
    );
  }

  _selectDeliveryMethod(String method) {
    setState(() {
      if (method == selectedDeliveryMethod) {
        selectedDeliveryMethod = "";
        return;
      }
      selectedDeliveryMethod = method;
    });
  }
}

class CheckedMethodIcon extends StatelessWidget {
  const CheckedMethodIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: outalmaLightBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}

class UncheckedMethodIcon extends StatelessWidget {
  const UncheckedMethodIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        border: Border.all(
          width: .5,
          color: Colors.grey,
        ),
      ),
    );
  }
}
