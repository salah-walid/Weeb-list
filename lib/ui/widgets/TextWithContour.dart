import 'package:flutter/material.dart';

class TextWithContour extends StatelessWidget {

  final String text;
  final TextStyle style;
  final Color contourColor;
  final double strokeWidth;

  const TextWithContour(this.text, {Key key, this.style, @required this.contourColor,@required this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: style?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = contourColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: style
        ),
      ],
    );
  }
}