import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double red = 0;
  double green = 0;
  double blue = 0;
  int size = 0;
  int s = 50;
  int m = 300;
  int l = 500;

  void sizeUp() {
    print('sizeUp');
    setState(() {
      size += 50;
      if (size > 500) {
        size = 500;
      }
    });
  }

  void sizeS() {
    print('sizeUp');
    setState(() {
      size = s;
    });
  }

  void sizeM() {
    print('sizeUp');
    setState(() {
      size = m;
    });
  }

  void sizeL() {
    print('sizeUp');
    setState(() {
      size = l;
    });
  }

  void sizeDown() {
    setState(() {
      size -= 50;
      if (size < 50) {
        size = 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful'),
        actions: [
          IconButton(
            onPressed: sizeUp,
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: sizeS,
            icon: const Text('S'),
          ),
          IconButton(
            onPressed: sizeM,
            icon: const Text('M'),
          ),
          IconButton(
            onPressed: sizeL,
            icon: const Text('L'),
          ),
          IconButton(
            onPressed: sizeDown,
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.alarm,
              size: size.toDouble(),
              color: Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1),
            ),
          ),
          Slider(
              min: 0,
              max: 255,
              activeColor: Colors.red,
              value: red,
              onChanged: (double value) {
                setState(() {
                  red = value;
                });
              }),
              Slider(
              min: 0,
              max: 255,
              activeColor: Colors.green,
              value: green,
              onChanged: (double value) {
                setState(() {
                  green = value;
                });
              }),
              Slider(
              min: 0,
              max: 255,
              activeColor: Colors.blue,
              value: blue,
              onChanged: (double value) {
                setState(() {
                  blue = value;
                });
              }),
        ],
      ),
    );
  }
}
