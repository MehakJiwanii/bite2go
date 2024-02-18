import 'package:bite2go/Screens/ResetPassword/OTP.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Forgot Your Password?',
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: MPrimaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Don’t worry! It happens. Please enter the address associated with your account.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff161616),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x3FD9D9D9),
                  hintText: 'Email/PhoneNumber',
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 25,
            ),
            customebtn(
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTP(),
                    ));
              },
              'Submit',
            )
          ],
        ),
      ),
    );
  }
}
