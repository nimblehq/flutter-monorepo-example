library shared;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedWidget extends StatelessWidget {
  final String name;

  SharedWidget({this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Using Shared UI in: $name",
      style: TextStyle(
          color: Colors.red, fontWeight: FontWeight.w300, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}
