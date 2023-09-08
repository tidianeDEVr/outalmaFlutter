import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/login_register/components/security.button.component.dart';
import 'package:outalma/views/screens/overview/overview.screen.dart';

int actualStep = 0;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
bool isPasswordHidded = true;
OtpFieldController otpController = OtpFieldController();

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double stepperBarWidth = (MediaQuery.of(context).size.width - 50) / 3;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: stepperBarWidth,
                    height: 5,
                    color: outalmaMainBlue,
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    width: stepperBarWidth,
                    height: 5,
                    color: actualStep >= 1 ? outalmaMainBlue : Colors.grey[400],
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: stepperBarWidth,
                    height: 5,
                    color: actualStep >= 2 ? outalmaMainBlue : Colors.grey[400],
                  ),
                ],
              ),
            ),
            Container(height: 10),
            Visibility(
              visible: actualStep == 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  Container(height: 10),
                  Text(
                    'Entrez l’adresse e-mail utilisée pour créer votre compte pour que le code soit envoyé.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 20,
                      top: 8,
                      bottom: 8,
                    ),
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    width: 1, color: outalmaGreyBorder),
                              ),
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              child: const Icon(
                                Icons.mail_outline,
                                color: outalmaMainBlue,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(height: 30),
                  InkWell(
                      onTap: () {
                        setState(() {
                          actualStep++;
                        });
                      },
                      child: const SecurityButton(label: 'ENVOYER LE CODE'))
                ],
              ),
            ),
            Visibility(
              visible: actualStep == 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saisie du code de vérification',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Container(height: 10),
                  Text(
                    'Veuillez entrer le code de vérification envoyé à votre adresse e-mail',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 20),
                  OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 5,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      // print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      // print("Completed: " + pin);
                      setState(() {
                        actualStep++;
                      });
                    },
                  ),
                  Container(height: 10),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Renvoyer le code',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: outalmaMainBlue,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Visibility(
              visible: actualStep == 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nouveau mot de passe',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  Container(height: 10),
                  Text(
                    'Veuillez entrer et confirmer votre nouveau mot de passe :',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: isPasswordHidded,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordHidded = !isPasswordHidded;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 10,
                          height: 10,
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: outalmaMainBlue,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: outalmaMainBlue,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      labelText: 'Mot de passe',
                    ),
                  ),
                  Container(height: 15),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: isPasswordHidded,
                    decoration: const InputDecoration(
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
                          width: 2,
                          color: outalmaMainBlue,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      labelText: 'Confirmation du mot de passe',
                    ),
                  ),
                  Container(height: 30),
                  InkWell(
                      onTap: () => {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const OverviewScreen(),
                              ),
                            ),
                          },
                      child: const SecurityButton(label: 'ENREGISTRER'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
