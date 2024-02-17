import 'package:bite2go/Screens/Login/SignupScreen.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 23,
                color: MPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Email',
                focusColor: Colors.grey,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: passToggle,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      passToggle = !passToggle;
                    });
                  },
                  child: Icon(
                      passToggle ? Icons.visibility_off : Icons.visibility),
                ),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.grey,
                ),
                hintText: 'Password',
                focusColor: Colors.grey,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            width: 350,
            height: 58,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ));
                },
                child: Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
