import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<List<Question>> _futureQuestions;
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _futureQuestions = fetchQuestions();
  }

  Future<List<Question>> fetchQuestions() async {
    final response =
    await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));

    if (response.statusCode == 200) {
      List<dynamic> questionsJson = jsonDecode(response.body)['results'];
      List<Question> questions =
      questionsJson.map((json) => Question.fromJson(json)).toList();
      setState(() {
        _questions = questions;
      });
      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }

  void answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
      Fluttertoast.showToast(
        msg: 'Correct!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Incorrect!',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('You scored $_score out of ${_questions.length}'),
          actions: <Widget>[
            TextButton(
              child: Text('Restart Quiz'),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  _score = 0;
                  _futureQuestions = fetchQuestions();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: FutureBuilder<List<Question>>(
        future: _futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to fetch questions'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No questions available'));
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Question ${_currentIndex + 1}/${_questions.length}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _questions[_currentIndex].question,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ..._questions[_currentIndex].options.map((option) {
                    return ElevatedButton(
                      onPressed: () {
                        answerQuestion(option == _questions[_currentIndex].correctAnswer);
                      },
                      child: Text(option),
                    );
                  }).toList(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class Question {
  final String question;
  final String correctAnswer;
  final List<String> options;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> options = List<String>.from(json['incorrect_answers']);
    options.add(json['correct_answer']);
    options.shuffle();
    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      options: options,
    );
  }
}