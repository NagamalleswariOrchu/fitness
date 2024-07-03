import 'package:flutter/material.dart';
import 'package:your_language_app/models/question.dart'; // Create a model for your questions

class QuizScreen extends StatefulWidget {
  final String category;

  QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0; // Track current question index
  List<Question> _questions = []; // Replace with your list of questions

  @override
  void initState() {
    super.initState();
    // Initialize your list of questions based on selected category
    // Example:
    _questions = [
      Question('Question 1?', ['Option 1', 'Option 2', 'Option 3'], 0),
      Question('Question 2?', ['Option 1', 'Option 2', 'Option 3'], 1),
      // Add more questions
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.category}'),
      ),
      body: _questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _questions[_currentIndex].questionText,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          ..._questions[_currentIndex].options.map((option) {
            return ElevatedButton(
              onPressed: () {
                if (_currentIndex < _questions.length - 1) {
                  setState(() {
                    _currentIndex++;
                  });
                } else {
                  // Display quiz results or navigate to next screen
                  // Implement your logic here
                }
              },
              child: Text(option),
            );
          }).toList(),
        ],
      ),
    );
  }
}