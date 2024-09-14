import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double spacing;

  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 15.0,
    this.textStyle,
    this.iconColor,
    this.spacing = 8.0, // Space between icon and text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor ?? Theme.of(context).iconTheme.color,
        ),
        SizedBox(width: spacing),
        Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
