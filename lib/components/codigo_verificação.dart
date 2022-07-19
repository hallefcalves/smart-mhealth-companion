import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CodigoVerificacao extends StatelessWidget {
  const CodigoVerificacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: const TextField(
              keyboardType: TextInputType.number),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: const TextField(
              keyboardType: TextInputType.number),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: const TextField(
              keyboardType: TextInputType.number),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: const TextField(
              keyboardType: TextInputType.number),
          ),
        ),
      ],
    );
  }
}
