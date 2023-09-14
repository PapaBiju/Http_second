import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  TextEditingController idController = TextEditingController();
  String responseText = "";

  Future<void> deleteData() async {
  try {
    final response = await http.delete(
      Uri.parse('https://dummy.restapiexample.com/api/v1/delete/1'), // Replace with the new API endpoint and the employee ID to delete
    );

    if (response.statusCode == 200) {
      setState(() {
        responseText = "DELETE Request Response: Employee deleted successfully";
      });
    } else {
      setState(() {
        responseText = "Failed to delete employee: ${response.statusCode}";
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
        title: Text('DELETE Request'),
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
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: Text('Delete Post'),
            ),
            SizedBox(height: 20),
            Text(responseText),
          ],
        ),
      ),
    );
  }
}
