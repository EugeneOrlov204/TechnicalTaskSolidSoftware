import 'package:flutter/material.dart';

import 'package:project/utils/colors_manager.dart';
import 'package:project/utils/images_manager.dart';
import 'package:project/utils/text_manager.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  Color _backgroundColor = Colors.green;
  Color _textColor = Colors.black;
  int _clicksCount = 0;
  String _randomPictureUrl = getRandomPictureUrl();

  _previousPage(BuildContext context) async {
    Navigator.of(context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: const ValueKey("dismiss_key"),
        direction: DismissDirection.startToEnd,
        child: GestureDetector(
          onTap: updateUI,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_randomPictureUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Hey there!\nYou clicked $_clicksCount times',
                style: TextStyle(
                    fontSize: getRandomTextSize(),
                    color: _textColor,
                    decoration: TextDecoration.none),
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
        if  (direction == DismissDirection.startToEnd) {
            _previousPage(context);
          }
        });
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
}
