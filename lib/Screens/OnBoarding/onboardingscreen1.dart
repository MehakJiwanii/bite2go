import 'package:bite2go/Screens/Screen2.dart';
import 'package:bite2go/constants/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final pics = [
    'Assets/Images/OnBoarding/Screen1.svg',
    'Assets/Images/OnBoarding/Screen2.svg',
    'Assets/Images/OnBoarding/Screen3.svg',
    //'Assets/Images/OnBoarding/Screen4.svg',
  ];
  final text = [
    'All your favourites restaurants',
    'Unmatched reliability',
    '24/7 support\nfor you',
    //'Eat it in your\nown cozy comfort'
  ];
  final text2 = [
    'Order from the best local restaurants\nwith ease and on-demand delivery',
    'Experience peace of mind while tracking your order in real time',
    'Something came up? Talk to a real person.\nWe are here to help',
    //'Want a food of your mood?\nGet your tummies filled with the edible good',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen2(),
                        ));
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: MPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenHeight = constraints.maxHeight;
                  final screenWidth = constraints.maxWidth;

                  return CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * 0.7,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: pics.asMap().entries.map((entry) {
                      final index = entry.key;
                      final imagePath = entry.value;

                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                height: screenHeight * 0.40,
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              Text(
                                text[index],
                                style: GoogleFonts.montserrat(
                                  fontSize: screenHeight * 0.04,
                                  color: MPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              Text(
                                text2[index],
                                style: GoogleFonts.montserrat(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pics.length,
                (index) => buildDot(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? MPrimaryColor : Colors.grey,
        ),
      ),
    );
  }
}
