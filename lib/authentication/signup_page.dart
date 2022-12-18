import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/authservices.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/homepage.dart';

import '../view/components/widgets/app_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const route = 'signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String fullName = "";
  String email = "";
  String password = "";
  AuthServices authService = AuthServices();

  Future signUp() async {
    showLoading(context);
    await authService
        .registerUserWithEmailandPassword(fullName, email, password)
        .then((value) async {
      if (value == true) {
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(email);
        await HelperFunction.saveUserNameSF(fullName);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false);
      } else {
        showSnackBar(context, Colors.red, value);
      }
    });
  }

  showLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Please wait")
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6D4D4),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 00, horizontal: 00),
              child: Image.asset('assets/images/heart.png',scale: 2.0,),
            ),
            const SizedBox(
              height: 00,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "New Account",
                  style: TextStyle(
                      color: Color(0xffE41B27),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration( 
              color: Color(0xffF4C2C2),
              borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                      width: 300,
                      child: inputFeild(
                          hinttxt: "Name",
                          icon: CupertinoIcons.profile_circled,
                          fieldcontroller: _nameController,
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                          obscuretext: false)),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: 300,
                      child: inputFeild(
                          hinttxt: "Mail",
                          icon: CupertinoIcons.mail,
                          fieldcontroller: _emailController,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          obscuretext: false)),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: 300,
                      child: inputFeild(
                          hinttxt: "Password",
                          icon: CupertinoIcons.lock,
                          fieldcontroller: _passwordController,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscuretext: true)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 220,
                child: AppButton(
                    txt: "Sign up",
                    onTap: () {
                      signUp();
                    })),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not the first time here?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                    onPressed: (() {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.route, (route) => false);
                    }),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Color(0xffE41B27)),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
