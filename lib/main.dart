import 'package:flutter/material.dart';
import 'package:http_second/home_page.dart' as Home;
import 'package:http_second/about_page.dart'; // Import the About Page without a prefix

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home.HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
  Navigator.pop(context); // Close the Drawer
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutPage()),
  );
},

            ),
          ],
        ),
      ),
      body: Center(
        child: Text('This is the Home Page'),
      ),
    );
  }
}
