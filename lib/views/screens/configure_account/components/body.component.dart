import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/login_register/components/security.button.component.dart';
import 'package:outalma/views/screens/overview/overview.screen.dart';
import 'package:outalma/views/shared/components/outalma.white.logo.dart';

TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    emailController.text = 'cheikhtiindiaye@gmail.com';
    return Container(
      color: outalmaMainBlue,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const WhiteLogo(size: 120),
          Container(height: 50),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Configurer mon compte',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(height: 30),
                    TextField(
                      controller: firstnameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: outalmaTileBackground,
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        labelText: 'Prénom',
                      ),
                    ),
                    Container(height: 15),
                    TextField(
                      controller: lastnameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: outalmaTileBackground,
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        labelText: 'Nom',
                      ),
                    ),
                    Container(height: 15),
                    TextField(
                      enabled: false,
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: outalmaTileBackground,
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        labelText: 'E-mail',
                      ),
                    ),
                    Container(height: 15),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: outalmaTileBackground,
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        labelText: 'Numéro de téléphone',
                      ),
                    ),
                    Container(height: 30),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const OverviewScreen(),
                            ),
                          );
                        },
                        child: const SecurityButton(label: 'VALIDER'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
