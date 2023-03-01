import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
        ),
        home: MyApp()),
  );
}
