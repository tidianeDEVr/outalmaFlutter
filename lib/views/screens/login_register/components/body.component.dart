import 'package:flutter/material.dart';
import 'package:outalma/utils/outalma.config.dart';
import 'package:outalma/views/screens/configure_account/configure.account.screen.dart';
import 'package:outalma/views/screens/login_register/components/security.button.component.dart';
import 'package:outalma/views/screens/overview/overview.screen.dart';
import 'package:outalma/views/screens/recovery_password/recovery.password.screen.dart';
import 'package:outalma/views/shared/components/outalma.blue.logo.dart';

TextEditingController identifiantController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isPasswordHidded = true;
bool isLoginActive = true;
bool isTermsConditionsChecked = false;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BlueLogo(size: 100),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                isLoginActive ? 'Connexion' : 'Inscription',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              controller: identifiantController,
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
                labelText: 'Identifiant',
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
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerRight,
              child: isLoginActive
                  ? TextButton(
                      onPressed: () => {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RecoveryPasswordScreen(),
                          ),
                        ),
                      },
                      child: const Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                          color: outalmaMainBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Checkbox(
                            fillColor:
                                MaterialStateProperty.all(outalmaMainBlue),
                            value: isTermsConditionsChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isTermsConditionsChecked = value!;
                              });
                            }),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: 'J\'accepte les ',
                              style: TextStyle(color: Colors.grey[800]),
                              children: const [
                                TextSpan(
                                  text: 'termes',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: outalmaMainBlue),
                                ),
                                TextSpan(text: ' et '),
                                TextSpan(
                                  text: 'conditions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: outalmaMainBlue),
                                ),
                                TextSpan(
                                    text:
                                        ' et la politique de confidentialité.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            InkWell(
              onTap: () => _loginOrRegister(),
              child: isLoginActive
                  ? const SecurityButton(label: 'SE CONNECTER')
                  : Opacity(
                      opacity: isTermsConditionsChecked ? 1 : .5,
                      child: const SecurityButton(label: 'S\'INSCRIRE'),
                    ),
            ),
            Visibility(
              visible: isLoginActive,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous n\'avez pas de compte ?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Inscrivez-vous',
                        style: TextStyle(
                          color: outalmaMainBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoginActive = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isLoginActive,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous avez un compte ?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Connectez-vous',
                        style: TextStyle(
                          color: outalmaMainBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoginActive = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      width: 190,
                      child: isLoginActive
                          ? const Text(
                              ' Ou connectez-vous avec',
                              style: TextStyle(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text(
                              ' Ou inscrivez-vous avec',
                              style: TextStyle(
                                backgroundColor: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Image.asset(
                      'lib/assets/images/google.png',
                      width: 24,
                    ),
                  ),
                  Container(width: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Image.asset(
                      'lib/assets/images/facebook.png',
                      width: 24,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _loginOrRegister() {
    if (isLoginActive) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const OverviewScreen(),
        ),
      );
    } else {
      if (!isTermsConditionsChecked) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ConfigureAccountScreen(),
        ),
      );
    }
  }
}
