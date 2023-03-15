import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkpoint 01')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('../images/benny.jpg')),
              accountName: Text("Naldo Benny"),
              accountEmail: Text("popo@gmail.com"),
            ),
            ListTile(
              title: Text('Primary'),
              leading: Icon(
                Icons.facebook,
              ),
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(
                Icons.social_distance,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Promotions'),
              leading: Icon(
                Icons.discount,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Matheus Oliveira e Vitor Torres',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 40,
              fontFamily: 'Pacifico',
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 475, vertical: 50),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.airplane_ticket,
                  ),
                  Icon(Icons.mail, color: Color.fromARGB(255, 255, 0, 0)),
                  Icon(
                    Icons.car_rental,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.whatsapp),
      ),
    );
  }
}
