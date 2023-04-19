import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_demo/contato.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> listaContatos = [

    Contato('Vitor', 'vtorresdantas7@gmail.com'),
    Contato('Matheus', 'matheus@gmail.com'),
    Contato('Victor', 'vct@gmail.com')
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: ListView.builder(
        itemCount: listaContatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: 
            Icon(Icons.alarm),
            title: Text(listaContatos[index].nomeCompleto),
            subtitle: Text(listaContatos[index].email)
          );
        },
      ),
    );
  }
}
