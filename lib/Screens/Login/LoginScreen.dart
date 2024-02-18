import 'package:bite2go/Screens/Dummy.dart';
import 'package:bite2go/Screens/Login/Or.dart';
import 'package:bite2go/Screens/Login/SignupScreen.dart';
import 'package:bite2go/Screens/ResetPassword/ForgotPassword.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool passToggle = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _Login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passController.text);
      print('User Logged in: ${userCredential.user!.uid}');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dummy()));
    } catch (e) {
      print('Login Failed:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
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
              controller: emailController,
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
              controller: passController,
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
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ));
                  },
                  child: Text(
                    'Forgot Your Password?',
                    style: GoogleFonts.montserrat(
                        color: MPrimaryColor, fontWeight: FontWeight.w500),
                  )),
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
                  onPressed: _Login,
                  child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Or(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have An Account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: Text(
                    ' Sign Up',
                    style: GoogleFonts.montserrat(color: MPrimaryColor),
                  ),
                ),
              ],
            ),
          ])),
    ));
  }
}
