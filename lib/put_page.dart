import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PutPage extends StatefulWidget {
  @override
  _PutPageState createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  String responseText = "";

  Future<void> putData() async {
  try {
    final response = await http.put(
      Uri.parse('https://dummy.restapiexample.com/api/v1/update/1'), // Replace with the new API endpoint and the employee ID to update
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': 'Updated Employee Name',
        'salary': '55000',
        'age': '32',
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        responseText = "PUT Request Response: Employee updated successfully";
      });
    } else {
      setState(() {
        responseText = "Failed to update employee: ${response.statusCode}";
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
        title: Text('PUT Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Post ID'),
            ),
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
                putData();
              },
              child: Text('Update Post'),
            ),
            SizedBox(height: 20),
            Text(responseText),
          ],
        ),
      ),
    );
  }
}
