import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_companion/components/button.dart';

class PlaceholderWidget extends StatelessWidget {
 final Color color;
 final String texto;
 PlaceholderWidget(this.color, this.texto);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
     child: Center(child: CustomBtn(texto),
     )
   );
 }
}