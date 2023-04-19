import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewExemplo extends StatefulWidget {
  const ListViewExemplo({Key? key}) : super(key: key);

  @override
  State<ListViewExemplo> createState() => _ListViewExemploState();
}

class _ListViewExemploState extends State<ListViewExemplo> {
  final List<String> items = List.generate(50, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            
          );
        },
      ),
    );
  }
}
