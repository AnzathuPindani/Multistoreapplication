import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/auth/signup.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/auth/widgets.dart';
import 'package:siopa/app/screen/main_screens/costumer_screen/bottum_nav.dart';
import 'package:siopa/app/screen/main_screens/supplier_screen.dart/auth/loginscreen.dart';
import 'package:siopa/app/screen/main_screens/widget/button_container.dart';
import 'package:siopa/app/utils/colors.dart';
import 'package:siopa/app/utils/regex.dart';
import 'package:siopa/app/widget/button_container.dart';

class CostumerLoginScreen extends StatefulWidget {
  const CostumerLoginScreen({super.key});

  @override
  State<CostumerLoginScreen> createState() => _CostumerLoginScreenState();
}

class _CostumerLoginScreenState extends State<CostumerLoginScreen> {
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  late String email;
  late String password;
  late String profileImage;
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          backgroundColor: xBlack87,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Sopia",
                          style: TextStyle(
                            color: xWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.adobe_rounded,
                          color: xBlue,
                          size: 38,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: xBlack87,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: xBlue.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: -20,
                              left: -50,
                              child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: xBlue.withOpacity(0.1)))),
                          Positioned(
                              left: -80,
                              top: -50,
                              child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: xBlack.withOpacity(0.5)))),
                          Positioned(
                            child: Container(
                                height: 250,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Costumer Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter you Email";
                              } else if (value.isEmailValidate() == false) {
                                return "Invalid Email";
                              } else if (value.isEmailValidate() == true) {
                                return null;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            // controller: _emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xBlue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                labelText: 'Email',
                                contentPadding: const EdgeInsets.all(13),
                                labelStyle: const TextStyle(color: xWhite),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xBlue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xGreen),
                                  borderRadius: BorderRadius.circular(25),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter you Password";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              password = value;
                            },
                            // controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xBlue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: xWhite,
                                    )),
                                labelText: 'Password',
                                contentPadding: const EdgeInsets.all(13),
                                labelStyle: const TextStyle(color: xWhite),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xBlue),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(width: 2, color: xGreen),
                                  borderRadius: BorderRadius.circular(25),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Forget Password ?")),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              login();
                            },
                            child: processing == true
                                ? const CircularProgressIndicator()
                                : const ButtonContainer(
                                    kWidth: 400,
                                    kHeight: 50,
                                    kColors: xBlue,
                                    title: "Login",
                                    ls: 0,
                                    fontwght: FontWeight.normal,
                                    fontsz: 14,
                                    bRadius: 25,
                                    icons: Icons.arrow_forward,
                                  ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Textbutton(
                            colors: xBlue,
                            title: "Do you want to sell products  ? ",
                            ontap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    const SupplierLoginScreen(),
                              ));
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Textbutton(
                    colors: xGrey,
                    title: "Don't have an account ? ",
                    text: "Sign up",
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CostumerSignUpScreen(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        _formKey.currentState!.reset();

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const CostumerHomeScreen(),
        ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          MyMessengerHelper.showSnackBar(
              _scaffoldKey, "No user exist with this email");
        } else if (e.code == 'wrong-password') {
          setState(() {
            processing = false;
          });
          MyMessengerHelper.showSnackBar(_scaffoldKey, "Password is Incorrect");
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      MyMessengerHelper.showSnackBar(_scaffoldKey, "Pls fill all fields");
    }
  }
}

class Textbutton extends StatelessWidget {
  const Textbutton({
    Key? key,
    required this.title,
    this.text,
    required this.ontap,
    required this.colors,
  }) : super(key: key);
  final String title;
  final String? text;
  final VoidCallback ontap;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: colors)),
            Text(
              text ?? '',
              style: const TextStyle(color: xBlue, fontSize: 15),
            ),
          ],
        ));
  }
}