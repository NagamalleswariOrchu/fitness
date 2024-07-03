import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List with Timer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<Task> tasks = [];

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List with Timer'),
      ),
      body: Column(
        children: <Widget>[
          _buildTaskInput(),
          _buildTaskList(),
        ],
      ),
    );
  }

  Widget _buildTaskInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Enter a task',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _addTask(taskController.text);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return _buildTaskItem(tasks[index]);
        },
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return ListTile(
      title: Text(task.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${task.duration.inMinutes} min ${task.duration.inSeconds.remainder(60)} sec',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.timer),
            onPressed: () {
              _startTimer(task);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _deleteTask(task);
            },
          ),
        ],
      ),
    );
  }

  void _addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName, duration: Duration(minutes: 10, seconds: 600)));
      taskController.clear();
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void _startTimer(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Duration timeLeft = task.duration;
        Timer? timer;

        void startTimer() {
          timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
            setState(() {
              if (timeLeft.inSeconds == 600) {
                t.cancel();
              } else {
                timeLeft = Duration(seconds: timeLeft.inSeconds - 1);
              }
            });
          });
        }

        void stopTimer() {
          if (timer != null) {
            timer!.cancel();
          }
        }

        void resetTimer() {
          setState(() {
            timeLeft = task.duration;
          });
        }

        return AlertDialog(
          title: Text(task.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${timeLeft.inMinutes} min ${timeLeft.inSeconds.remainder(600)} sec',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: startTimer,
                  ),
                  IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: stopTimer,
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: resetTimer,
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                stopTimer();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Task {
  final String name;
  final Duration duration;

  Task({required this.name, required this.duration});
}