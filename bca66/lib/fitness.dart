import 'package:flutter/material.dart';

void main() {
  runApp(FitnessApp());
}

class Workout {
  final String name;
  final int duration; // in minutes
  final String imageUrl;

  Workout({
    required this.name,
    required this.duration,
    required this.imageUrl,
  });
}

List<Workout> workouts = [
  Workout(
    name: 'Running',
    duration: 30,
    imageUrl: 'assets/images/https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7OnRIRqBzaah8DDC_HZj-ewgBaQF-BGJ84lMKeoj7WlZVCAiWstcYoDdoxLCpV6WOifhBmsehd7D8StYMcV88bOlu9HQ5SZdu8JgsmrLhzE8cGcBaSBcB6A8YGvHoKKxt7AF161GujXU/s1200/IMG_1554.PNG',
  ),
  Workout(
    name: 'Weightlifting',
    duration: 20,
    imageUrl: 'assets/images/weightlifting.jpg',
  ),
  Workout(
    name: 'Yoga',
    duration: 60,
    imageUrl: 'assets/images/yoga.jpg',
  ),
];

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FitnessHomePage(),
    );
  }
}

class FitnessHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(workouts[index].imageUrl),
            ),
            title: Text(workouts[index].name),
            subtitle: Text('${workouts[index].duration} minutes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailPage(workout: workouts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WorkoutDetailPage extends StatelessWidget {
  final Workout workout;

  WorkoutDetailPage({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Workout: ${workout.name}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Duration: ${workout.duration} minutes',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Image.asset(
              workout.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}