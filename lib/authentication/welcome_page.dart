// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/signup_page.dart';

import '../view/components/widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const route = 'welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFFF6D4D4),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Image.asset('assets/images/logo.png',scale: 1.0,),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration( 
                color: Color(0xffF4C2C2),
                borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Text(
                        
                        "Keep your medical records",
                        textAlign: TextAlign.center,
                        style: TextStyle(                 
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: 
                    SizedBox(
                        width: 220,
                        child: 
                          AppButton(
                            txt: "MedRecords Log In",
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.route);
                            },
                          ),
                        ),
                  ),
                  const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                TextButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, SignupPage.route);
                    }),
                    child: const Text(
                      "Sign Up Here",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE41B27)),
                    )),
                
              ],
            ),
                ],
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Text(
                        
                        "Keep your Patients records",
                        textAlign: TextAlign.center,
                        style: TextStyle(                 
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: 
                    SizedBox(
                        width: 220,
                        child: 
                          AppButton(
                            txt: "Doctors Log In",
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.route);
                            },
                          ),
                        ),
                  ),
                  const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                TextButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, SignupPage.route);
                    }),
                    child: const Text(
                      "Sign Up Here",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE41B27)),
                    )),
                
              ],
            ),

                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                TextButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, SignupPage.route);
                    }),
                    child: const Text(
                      "Sign Up Here",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE41B27)),
                    )),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
