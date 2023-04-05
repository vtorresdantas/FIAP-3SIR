import 'package:calculadora_imc/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final IconData icone;
  final String texto;

  const IconContent({
    Key? key,
    required this.icone,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
    Icon(
      icone, 
    size: 88),
    SizedBox(height: 10),
    Text(
      texto, 
      style: kLabelTextStyle)
                    ],
                  );
  }
}