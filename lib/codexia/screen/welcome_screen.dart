import 'package:codexia_academy/codexia/screen/login_screen.dart';
import 'package:codexia_academy/codexia/screen/sign_up_screen.dart';
import 'package:codexia_academy/codexia/shared/const/assets_const.dart';
import 'package:codexia_academy/codexia/shared/const/color_const.dart';
import 'package:codexia_academy/codexia/shared/const/string_const.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 100,
              ),
          
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset( AssetsConst.welcomeImage,),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                StringConst.codexiaName,
                style: TextStyle(
                    color: ColorConst.reuseBackgroundColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 2),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                StringConst.codexiaSlogan,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: ColorConst.reuseBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Text(
                          StringConst.logIn,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color:ColorConst.reuseBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Text(
                          StringConst.signUp,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
