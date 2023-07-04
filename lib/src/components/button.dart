import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/data.dart';
import '../utils/theme.dart';

class Button extends StatefulWidget {
  final String title;
  final String fontFamily;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final double borderRadius;
  final double elevation;
  final Color color;
  final Color fontColor;
  final bool loading;
  final BorderSide border;

  const Button({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.width,
    this.height,
    this.fontColor,
    this.color,
    this.loading = false,
    this.border,
    this.fontSize,
    this.borderRadius,
    this.fontFamily,
    this.elevation,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
              side: widget.border ?? BorderSide.none),
           elevation: widget.elevation ?? 0,
          minimumSize: Size(
              widget.width != null ? widget.width : Data.size.width,
              widget.height != null ? widget.height : 60)),
      child: widget.loading
          ? Container(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: widget.fontColor ?? Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.title ?? '',
              style: TextStyle(
                  color: widget.fontColor != null
                      ? widget.fontColor
                      : Colors.white,
                  letterSpacing: 0.378,
                  fontFamily: 'GE SS',
                  fontWeight: FontWeight.w700,
                  fontSize: widget.fontSize ?? 20),
            ),
    );
  }
}
