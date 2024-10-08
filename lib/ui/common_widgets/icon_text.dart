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
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 15,
          color: Colors.grey,
        ),
        SizedBox(width: spacing),
        SizedBox(
          width: size.width * 0.45,
          child: Text(
            text,
            style: const TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
