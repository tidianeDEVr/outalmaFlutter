import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';

class ModalUserMenuComponent extends StatefulWidget {
  const ModalUserMenuComponent({super.key});

  @override
  State<ModalUserMenuComponent> createState() => _ModalUserMenuComponentState();
}

class _ModalUserMenuComponentState extends State<ModalUserMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 330,
      child: Column(
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
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
            margin: const EdgeInsets.only(top: 20, bottom: 15),
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
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/images/ava.png'),
                      radius: 21,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Mon profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
            margin: const EdgeInsets.only(bottom: 15),
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
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 19),
                      child: const Text(
                        'Paramètres',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
            margin: const EdgeInsets.only(bottom: 15),
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
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.headset_mic_rounded,
                      color: Colors.black,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 19),
                      child: const Text(
                        'Centre d\'aides',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
