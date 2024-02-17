import 'package:bite2go/Screens/Login/LoginScreen.dart';
import 'package:bite2go/Screens/Login/Or.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passToggle = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: screenWidth * 0.05,
                    color: MPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              buildTextField(
                hintText: 'Username',
                prefixIcon: Icons.person_2_outlined,
              ),
              SizedBox(height: screenHeight * 0.02),
              buildTextField(
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: screenHeight * 0.02),
              buildTextField(
                hintText: 'Phone number',
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: screenHeight * 0.02),
              buildTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock_open,
                isPassword: true,
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Checkbox(
                    activeColor: MPrimaryColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  Text(
                    "I agree to the",
                    style: GoogleFonts.montserrat(
                      fontSize: screenWidth * 0.033,
                      color: Color(0xFF161616),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " Terms & Conditions",
                    style: GoogleFonts.montserrat(
                      fontSize: screenWidth * 0.033,
                      color: MPrimaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " and",
                    style: GoogleFonts.montserrat(
                      fontSize: screenWidth * 0.033,
                      color: Color(0xFF161616),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " Privacy Policy",
                    style: GoogleFonts.montserrat(
                      fontSize: screenWidth * 0.033,
                      color: MPrimaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              buildElevatedButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Or(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return TextFormField(
      obscureText: isPassword ? passToggle : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0x3FD9D9D9),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        hintText: hintText,
        focusColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget buildElevatedButton({
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
