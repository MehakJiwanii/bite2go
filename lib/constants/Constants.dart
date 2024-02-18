import 'package:flutter/material.dart';

final MPrimaryColor = Color(0xFFFF9D01);
final MSecondaryColor = Color(0x3FD9D9D9);

customebtn(VoidCallback voidCallback, String text) {
  return Container(
      width: 350,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        onPressed: () {
          voidCallback;
        },
        child: Text(text),
      ));
}
//final Mbgcolor =
    // Theme.of(context as BuildContext).brightness == Brightness.light
    //     ? Colors.white
    //     : Colors.black;
