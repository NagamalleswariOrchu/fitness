import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pet_model.dart';
import 'pet_provider.dart';
import 'add_feeding_schedule_screen.dart';
import 'add_medical_record_screen.dart';

class PetProfileScreen extends StatelessWidget {
  final Pet pet;

  PetProfileScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(pet.imageUrl),
          ListTile(
            title: Text('Breed: ${pet.breed}'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Feeding Schedules',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pet.feedingSchedules.length,
              itemBuilder: (context, index) {
                FeedingSchedule schedule = pet.feedingSchedules[index];
                return ListTile(
                  title: Text('Time: ${schedule.time.toString()}'),
                  subtitle: Text('Type: ${schedule.type}\nNotes: ${schedule.notes}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFeedingScheduleScreen(petId: pet.id),
                ),
              );
            },
            child: Text('Add Feeding Schedule'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Medical Records',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pet.medicalRecords.length,
              itemBuilder: (context, index) {
                MedicalRecord record = pet.medicalRecords[index];
                return ListTile(
                  title: Text('Date: ${record.date.toString()}'),
                  subtitle: Text('Title: ${record.title}\nDetails: ${record.details}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMedicalRecordScreen(petId: pet.id),
                ),
              );
            },
            child: Text('Add Medical Record'),
          ),
        ],
      ),
    );
  }
}