import 'package:flutter/material.dart';

void main() {
  runApp(FitnessApp());
}

class Workout {
  final String name;
  final int duration; // in minutes
  final String imageUrl;
  final String content; // Content related to workout

  Workout({
    required this.name,
    required this.duration,
    required this.imageUrl,
    required this.content,
  });
}

List<Workout> workouts = [
  Workout(
    name: 'Running',
    duration: 30,
    imageUrl: 'assets/images/https://qrcodechimp.s3.amazonaws.com/blog/wp-content/uploads/2020/02/gym-qr-code.png',
    content: 'Running is a method of terrestrial locomotion by which humans and other animals move rapidly on foot. Running is a gait with an aerial phase in which all feet are above the ground (though there are exceptions).',
  ),
  Workout(
    name: 'Weightlifting',
    duration: 20,
    imageUrl: 'assets/images/weightlifting.jpg',
    content: 'Weightlifting helps build strength and muscle mass.',
  ),
  Workout(
    name: 'Yoga',
    duration: 60,
    imageUrl: 'assets/images/yoga.jpg',
    content: 'Yoga improves flexibility, strength, and mental wellbeing.',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Workout: ${workout.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Duration: ${workout.duration} minutes',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Image.asset(
              workout.imageUrl,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              workout.content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}