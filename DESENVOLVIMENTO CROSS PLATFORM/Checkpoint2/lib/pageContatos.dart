import 'package:checkpoint2/contato.dart';
import 'package:flutter/material.dart';

class ContatosPage extends StatefulWidget {
  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  final Contatos = [
    Contato(
        nome: "Vitor",
        email: 'vtorres@gmail.com',
        image: 'https://avatars.githubusercontent.com/u/62342894?v=4',
        favorite: false),
    Contato(
        nome: "Matheus",
        email: 'matheus@hotmail.com',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUysEXH1VhPTsop0bSj1JgAlXlRdJWyO6Bxg&usqp=CAU',
        favorite: false),
    Contato(
        nome: "Kaique",
        email: 'kaique@outlook.com',
        image:
            'data:image/jpeg;base64,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',
        favorite: false),
  ];

  void contatoFavorito(int index) {
    setState(() {
      Contatos[index].favorite = !Contatos[index].favorite;
    });
  }

  int get totalFavoritos =>
      Contatos.where((Contato contato) => contato.favorite).length;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Quantidade de favoritos: $totalFavoritos'),
      ),
      body: ListView.builder(
        itemCount: Contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(Contatos[index].image),
                  child: Text(Contatos[index].nome[0])),
              title: Text(Contatos[index].nome),
              subtitle: Text(Contatos[index].email),
              trailing: IconButton(
                icon: Icon(
                  Contatos[index].favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Contatos[index].favorite ? Colors.red : null,
                ),
                onPressed: () => contatoFavorito(index),
              ));
        },
      ),
    );
  }
}
