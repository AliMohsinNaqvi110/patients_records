import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.blueGrey,
      )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
          color: Colors.cyan,
          width: 1.5
      )
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5
      )
  ),
);