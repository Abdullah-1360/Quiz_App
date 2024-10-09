import 'package:flutter/material.dart';
import 'QuestionScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Home'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Question Screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionScreen()),
            );
          },
          child: Text('Start Quiz'),
        ),
      ),
    );
  }
}
