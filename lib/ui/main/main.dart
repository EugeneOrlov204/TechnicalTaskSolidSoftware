import 'package:flutter/material.dart';
import 'package:project/utils/colors_manager.dart';
import 'package:project/utils/images_manager.dart';

import '../../utils/constants.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Main(),
    ),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Color _backgroundColor = Colors.green;
  Color _textColor = Colors.black;
  int _clicksCount = 0;
  String _randomPictureUrl = getRandomPictureUrl();
  final bool _isBackgroundAnImage = true;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: updateUI,
      child:
          _isBackgroundAnImage ? loadImageBackground() : loadColorBackground(),
    );
  }

  updateUI() {
    _backgroundColor = getRandomColor();
    _textColor = getRandomColor();
    _randomPictureUrl = getRandomPictureUrl();
    setState(() => _randomPictureUrl);
    setState(() => _clicksCount++);
    setState(() => _textColor);
    setState(() => _backgroundColor);
  }

  Container loadImageBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_randomPictureUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: getAlign(),
    );
  }

  Container loadColorBackground() {
    return Container(
      color: _backgroundColor,
      child: getAlign(),
    );
  }

  getAlign() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Hey there!\nYou clicked $_clicksCount times',
        style: TextStyle(
            fontSize: getRandomTextSize(),
            color: _textColor,
            decoration: TextDecoration.none),
        textDirection: TextDirection.ltr,
      ),
    );
  }

  double getRandomTextSize() => random.nextInt(fontSizeRange) + minFontSize;
}