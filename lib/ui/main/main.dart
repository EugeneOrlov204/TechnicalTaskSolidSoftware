
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Main())));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  MainState createState() => MainState();
}



class MainState extends State<Main> {
  Color backgroundColor = Colors.green;
  Color textColor = Colors.black;
  int value = 0;
  String randomPictureUrl = "https://picsum.photos/200/300";
  bool isImageBackground = true;

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
      alpha,
      random.nextInt(colorComponentsRange),
      random.nextInt(colorComponentsRange),
      random.nextInt(colorComponentsRange),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isImageBackground) {
      return setImageBackground();
    }
    return setColorBackground();
  }

  GestureDetector setImageBackground() => GestureDetector(
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
                  fontSize: random.nextInt(fontSizeRange) + minFontSize,
                  color: textColor,
                  decoration: TextDecoration.none),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      );

  GestureDetector setColorBackground() => GestureDetector(
        onTap: changeColors,
        child: Container(
          color: backgroundColor,
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
