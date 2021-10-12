import 'package:flutter/material.dart';

import 'constants.dart';

Color getRandomColor() {
  return Color.fromARGB(
    alpha,
    random.nextInt(colorComponentsUpperLimit),
    random.nextInt(colorComponentsUpperLimit),
    random.nextInt(colorComponentsUpperLimit),
  );
}