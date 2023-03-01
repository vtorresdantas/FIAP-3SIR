import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('First app'),
        ),
        body: Center(
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 50),
            textDirection: TextDirection.ltr,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      );
    
  }

}
