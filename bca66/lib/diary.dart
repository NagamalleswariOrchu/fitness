import 'package:flutter/material.dart';

void main() => runApp(DiaryApp());

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiaryScreen(),
    );
  }
}

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<String> entries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diary'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(entries[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEntry(context);
        },
        tooltip: 'Add Entry',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addEntry(BuildContext context) async {
    String result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Diary Entry'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter your thoughts...'),
            onChanged: (value) {},
            onSubmitted: (value) {
              Navigator.of(context).pop(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        entries.add(result);
      });
    }
  }
}