import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.borderColor,
  });

  final Widget widget;
  final void Function() onPressed;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: onPressed,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: borderColor ?? Colors.white, width: 3),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widget,
          ),
        ),
      ),
    );
  }
}
