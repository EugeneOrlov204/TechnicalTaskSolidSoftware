import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: MyClass())));
}

class MyClass extends StatefulWidget {
  const MyClass({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<MyClass> {
  Color backgroundColor = Colors.green;
  Color textColor = Colors.black;
  int value = 0;
  String randomPictureUrl = "https://picsum.photos/200/300";
  final random = Random();
  final int colorComponentsRange = 256;
  final int alpha = 255;
  final minFontSize = 20.0;
  final fontSizeRange = 10;

  changeColors() {
    backgroundColor = getRandomColor();
    textColor = getRandomColor();
    updateImage();
    setState(() => randomPictureUrl);
    setState(() => ++value);
    setState(() => textColor);
    setState(() => backgroundColor);
  }

  updateImage() {
    randomPictureUrl="https://picsum.photos/200/300?v=${DateTime.now().millisecondsSinceEpoch}";
  }

  Color getRandomColor() {
    return Color.fromARGB(
      alpha,
      random.nextInt(colorComponentsRange),
      random.nextInt(colorComponentsRange),
      random.nextInt(colorComponentsRange),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: changeColors,
  //     child: Container(
  //       color: backgroundColor,
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Text(
  //           'Hey there!\nYou clicked $value times',
  //           style: TextStyle(
  //               fontSize: random.nextInt(fontSizeRange) + minFontSize,
  //               color: textColor,
  //               decoration: TextDecoration.none),
  //           textDirection: TextDirection.ltr,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeColors,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    randomPictureUrl
                ),
                fit: BoxFit.cover
            )
        ),
        // color: backgroundColor,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Hey there!\nYou clicked $value times',
            style: TextStyle(
                fontSize: random.nextInt(fontSizeRange) + minFontSize,
                color: textColor,
                decoration: TextDecoration.none),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
