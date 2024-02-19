import 'package:flutter/material.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
                'Enter OTP',
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
              "A 4 digit code has been sent to +91 9876543210",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < _otpControllers.length; i++)
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _otpControllers[i],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _focusNextField(i);
                        }
                      },
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.zero,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: MPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 25,
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
                          builder: (context) => OTP(),
                        ));
                  },
                  child: Text('Verify'),
                ))
          ],
        ),
      ),
    );
  }

  void _focusNextField(int currentIndex) {
    if (currentIndex < _otpControllers.length - 1) {
      FocusScope.of(context).nextFocus();
    } else {
      // Submit or perform any action when the last digit is entered
      // For example, validate the OTP or move to the next screen
      print(
          'Entered OTP: ${_otpControllers.map((controller) => controller.text).join()}');
    }
  }
}
