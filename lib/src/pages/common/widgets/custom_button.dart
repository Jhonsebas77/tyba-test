import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final VoidCallback buttonAction;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color titleColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final double borderRadius;
  final TextAlign textAlign;

  const CustomFlatButton({
    @required this.title,
    @required this.buttonAction,
    this.width,
    this.height,
    this.backgroundColor,
    this.titleColor,
    this.fontSize,
    this.borderRadius,
    this.textAlign,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    bool isEnabled = buttonAction != null;
    final minWidth = width ?? double.infinity;
    final bgColor = backgroundColor ?? Colors.white;
    final minHeight = height;
    return RawMaterialButton(
      onPressed: isEnabled ? buttonAction : null,
      child: Center(
        child: Text(
          title,
          textAlign: textAlign ?? TextAlign.center,
          style: TextStyle(
            color: isEnabled ? titleColor : Colors.grey[600],
          ),
        ),
      ),
      fillColor: isEnabled ? bgColor : Colors.grey,
      splashColor: bgColor,
      constraints: BoxConstraints(
        minWidth: minWidth,
        minHeight: minHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        side: BorderSide(
          color: borderColor,
          width: borderWidth ?? 0,
        ),
      ),
    );
  }
}
