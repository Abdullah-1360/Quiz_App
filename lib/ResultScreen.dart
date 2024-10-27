import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Make sure this is the correct import for your HomeScreen

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score is:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '$score / $total',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to Home Screen and remove all previous routes
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,  // Remove all the routes
                  );
                },
                child: Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
