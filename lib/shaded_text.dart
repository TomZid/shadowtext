library shaded_text;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

typedef ShadeBuilder = Widget Function(
    BuildContext context, String text, Color color);

class ShadedText extends StatelessWidget {
  final ShadeBuilder shadeBuilder;
  final String text;
  final Color shadeColor;
  final Color textColor;

  ShadedText(
      {@required this.shadeBuilder,
      @required this.text,
      @required this.shadeColor,
      @required this.textColor})
      : assert(shadeBuilder != null),
        assert(text != null),
        assert(shadeColor != null),
        assert(textColor != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Transform(
            transform: Matrix4.translationValues(5, 5, 0),
            child: shadeBuilder(context, text, shadeColor)),
        shadeBuilder(context, text, textColor)
      ],
    );
  }
}
