import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fitness App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to your Fitness App Dashboard!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to exercise screen
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen()));
              },
              child: Text('Track Your Workouts'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to navigate to fitness data screen
              },
              child: Text('View Your Fitness Data'),
            ),
          ],
        ),
      ),
    );
  }
}