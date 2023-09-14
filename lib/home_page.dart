import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'about_page.dart'; // Import the AboutPage class

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String responseText = "";

  Future<void> fetchData() async {
    // ... previous code for GET request

    // Rest of your code remains the same
  }

  Future<void> postData() async {
    // ... previous code for POST request

    // Rest of your code remains the same
  }

  Future<void> putData() async {
    // ... previous code for PUT request

    // Rest of your code remains the same
  }

  Future<void> deleteData() async {
    // ... previous code for DELETE request

    // Rest of your code remains the same
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Methods App'),
        backgroundColor: Colors.blue, // Change the app bar background color
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Change the background color of the app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                fetchData();
              },
              icon: Icon(Icons.get_app),
              label: Text('GET Data'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change the button color
                onPrimary: Colors.white, // Change the text color
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                postData();
              },
              icon: Icon(Icons.post_add),
              label: Text('POST Data'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change the button color
                onPrimary: Colors.white, // Change the text color
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                putData();
              },
              icon: Icon(Icons.edit),
              label: Text('PUT Data'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Change the button color
                onPrimary: Colors.white, // Change the text color
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                deleteData();
              },
              icon: Icon(Icons.delete),
              label: Text('DELETE Data'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Change the button color
                onPrimary: Colors.white, // Change the text color
              ),
            ),
            SizedBox(height: 20),
            Text(
              responseText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
