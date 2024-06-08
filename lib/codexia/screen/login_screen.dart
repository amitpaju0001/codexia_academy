import 'package:codexia_academy/codexia/screen/home_screen.dart';
import 'package:codexia_academy/codexia/screen/sign_up_screen.dart';
import 'package:codexia_academy/codexia/shared/const/assets_const.dart';
import 'package:codexia_academy/codexia/shared/const/color_const.dart';
import 'package:codexia_academy/codexia/shared/const/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset( AssetsConst.welcomeImage,),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(StringConst.usernameLabelText),
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text(StringConst.passwordLabelText),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (passToggle == true) {
                            passToggle = false;
                          } else {
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: ColorConst.reuseBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      },
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    StringConst.noAccount,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: const Text(
                      StringConst.createAccount,
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:ColorConst.reuseBackgroundColor,
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
