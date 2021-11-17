import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final void Function(BuildContext) onPressed;
  final BuildContext screenContext;
  final MaterialColor color;
  final Color background;

  const LikeButton({Key? key, required this.onPressed, required this.screenContext, required this.color, required this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: background,
        height: 50,
        width: 50,
        child: IconButton(
          icon: const Icon(Icons.favorite),
          color: color,
          onPressed: () => onPressed(screenContext),
        ),
      ),
    );
  }
}
