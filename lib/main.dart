import 'package:flutter/material.dart';
import 'constants.dart' as constants;

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
    randomPictureUrl =
        "https://picsum.photos/200/300?v=${DateTime.now().millisecondsSinceEpoch}";
  }

  Color getRandomColor() {
    return Color.fromARGB(
      constants.alpha,
      constants.random.nextInt(constants.colorComponentsRange),
      constants.random.nextInt(constants.colorComponentsRange),
      constants.random.nextInt(constants.colorComponentsRange),
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
                image: NetworkImage(randomPictureUrl), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Hey there!\nYou clicked $value times',
            style: TextStyle(
                fontSize: constants.random.nextInt(constants.fontSizeRange) +
                    constants.minFontSize,
                color: textColor,
                decoration: TextDecoration.none),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
