import 'package:bite2go/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Or extends StatefulWidget {
  const Or({super.key});

  @override
  State<Or> createState() => _OrState();
}

class _OrState extends State<Or> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('OR'),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(width: 2, color: Color(0xFFDB4437)))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'Assets/Images/Icons/Google.png',
                  height: 10,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(width: 2, color: Color(0xFF4267B2)))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'Assets/Images/Icons/Facebook.png',
                  height: 50,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(width: 2, color: Color(0xFF161616)))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'Assets/Images/Icons/Apple.png',
                  height: 50,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already Have An Account?"),
            Text(
              ' Sign In',
              style: GoogleFonts.montserrat(color: MPrimaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
