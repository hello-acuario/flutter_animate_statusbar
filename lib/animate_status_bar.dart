import 'dart:async';

import 'package:flutter/services.dart';

class StatusBarFrame {
  double x;
  double y;
  double height;
  double width;

  StatusBarFrame({this.x, this.y, this.height, this.width});
}

class AnimateStatusBar {
  static const MethodChannel _channel =
      const MethodChannel('animate_status_bar');

  static Future<StatusBarFrame> get frame async {
    final Map<dynamic, dynamic> frame = await _channel.invokeMethod('getFrame');
    return StatusBarFrame(
        x: frame["x"],
        y: frame["x"],
        width: frame["width"],
        height: frame["height"]);
  }

  static setFrame({duration = 0, x = 0, y = 0, width = 0, height = 0}) {
    _channel.invokeMethod('setFrame', {
      'duration': duration,
      'x': x,
      'y': y,
      'width': width,
      'height': height
    });
  }
}
