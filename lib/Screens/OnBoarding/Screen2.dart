import 'package:bite2go/Screens/Login/SignupScreen.dart';
import 'package:bite2go/Screens/ResetPassword/PartnerReg/Partne_Reg.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Image.asset('Assets/Images/OnBoarding/Eatingdonuts.gif'),
          Text(
            'Eat it in your\nown cozy comfort',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 23,
              color: MPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Want a food of your mood?\nGet your tummies filled with the edible good',
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
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
                  'Take a Bite',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Partner_Registration()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have a Food Business?'),
                Text(
                  'Join As a Partner.',
                  style: GoogleFonts.montserrat(
                      color: MPrimaryColor, fontWeight: FontWeight.w800),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
