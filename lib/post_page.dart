import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  String responseText = "";

Future<void> postData() async {
  try {
    final response = await http.post(
      Uri.parse('https://dummy.restapiexample.com/api/v1/create'), // Replace with the new API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': 'New Employee',
        'salary': '50000',
        'age': '30',
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        responseText = "POST Request Response:\nEmployee ID: ${data['data']['id']}";
      });
    } else {
      setState(() {
        responseText = "Failed to create employee: ${response.statusCode}";
      });
    }
  } catch (error) {
    setState(() {
      responseText = "Error: $error"; // Log the error message
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            ElevatedButton(
              onPressed: () {
                postData();
              },
              child: Text('Create Post'),
            ),
            SizedBox(height: 20),
            Text(responseText),
          ],
        ),
      ),
    );
  }
}
