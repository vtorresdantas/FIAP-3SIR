import 'package:calculadora_imc/components/icon_content.dart';
import 'package:calculadora_imc/constants.dart';
import 'package:flutter/material.dart';

import '../components/custom_card.dart';

class CalculadoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: customCard(
                      child: IconContent(
                    texto: ('Masculino'),
                    icone: Icons.male,
                  )),
                ),
                Expanded(
                  child: customCard(child: IconContent(texto: ('Feminino'),
                    icone: Icons.female,)),
                ),
              ],
            ),
          ),
          Expanded(
            child: customCard(
              child: Placeholder(),
            ),
          ),
          Expanded(
            child: customCard(
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
