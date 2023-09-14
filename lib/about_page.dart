import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
        backgroundColor: Colors.blue, // Change the app bar color
      ),
      body: Center(
        child: Container(
          width: double.infinity, // Make the container expand to the screen width
          padding: EdgeInsets.all(20.0), // Add some padding around the text
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Add a subtle shadow
              ),
            ],
          ),
          child: Text(
            'AKHIL BIJU\n21BEE1266', // Multi-line text
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24, // Increase the font size
              fontWeight: FontWeight.bold, // Make the text bold
              color: Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
