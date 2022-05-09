import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({required this.text, required this.color, Key? key}) : super(key: key);
  final Widget text;
  final Color color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12.0)
      ),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Center(child: widget.text),
    );
  }
}