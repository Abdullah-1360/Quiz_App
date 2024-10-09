import 'package:flutter/material.dart';
import 'ResultScreen.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Sample questions and answers
  List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Rome', 'Berlin'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': '4',
    },
    {
      'question': 'What is the largest planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'answer': 'Jupiter',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
      _score += 1;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex += 1;
      });
    } else {
      // Navigate to the result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: _score, total: _questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Questions'),
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              _questions[_currentQuestionIndex]['question'] as String,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: _buildOptions(), // This is a helper function to build the options
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> optionButtons = [];

    for (var option in _questions[_currentQuestionIndex]['options'] as List<
        String>) {
      optionButtons.add(
        ElevatedButton(
          onPressed: () => _answerQuestion(option),
          child: Text(option),
        ),
      );
      optionButtons.add(
          SizedBox(height: 10,width: 20,)); // Add some spacing between buttons
    }

    return optionButtons;
  }
}
