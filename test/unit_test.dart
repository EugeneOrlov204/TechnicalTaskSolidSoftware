import 'package:flutter_test/flutter_test.dart';

import 'package:project/utils/colors_manager.dart';
import 'package:project/utils/images_manager.dart';

void main() {
  test('Color components should be in the range from 0 to 255', () {
    for (int i = 0; i < 10000; i++) {
      var color = getRandomColor();
      expect(color.red >= 0 && color.red <= 255, true);
      expect(color.green >= 0 && color.green <= 255, true);
      expect(color.blue >= 0 && color.blue <= 255, true);
    }
  });

  test('image url must contain given pattern', () {
    const pattern = "https://picsum.photos/200/300";
    String imageUrl = getRandomPictureUrl();

    expect(imageUrl.contains(pattern), true);
  });
}
