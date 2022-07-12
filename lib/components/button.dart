import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn(this.btntext);
  final String btntext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {}, child: Text(btntext));
  }
}
