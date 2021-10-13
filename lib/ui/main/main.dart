import 'package:flutter/material.dart';
import 'package:project/utils/colors_manager.dart';
import 'package:project/utils/text_manager.dart';

import 'image_page.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        body: Column(
          children: const [
            Expanded(
              child: Main(),
            ),
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/image_page': (BuildContext context) => const ImagePage(),
        '/home': (BuildContext context) => const Main(),
      })
  );
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

  _nextPage(BuildContext context) async {
    Navigator.of(context).pushReplacementNamed("/image_page");
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: const ValueKey("dismiss_key"),
        direction: DismissDirection.endToStart,
        child: GestureDetector(
          onTap: updateUI,
          child: Container(
            color: _backgroundColor,
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
          if (direction == DismissDirection.endToStart) {
            _nextPage(context);
          }
        });
  }

  updateUI() {
    _backgroundColor = getRandomColor();
    _textColor = getRandomColor();
    setState(() => _clicksCount++);
    setState(() => _textColor);
    setState(() => _backgroundColor);
  }
}
