import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
      ),
      body: Center(
        child: Text('$contador'),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: increment, child: Icon(Icons.add)),
    );
  }

  void increment() {
    
    setState(() {
      contador++;
    });

  }
}
