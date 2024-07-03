import 'package:flutter/foundation.dart';
import 'pet_model.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> _pets = [
    Pet(
      id: '1',
      name: 'Buddy',
      breed: 'Labrador',
      imageUrl: 'https://place-puppy.com/200x150',
      feedingSchedules: [
        FeedingSchedule(
          time: DateTime.now().add(Duration(hours: 1)),
          type: 'Dry food',
          notes: '1 cup',
        ),
      ],
      medicalRecords: [
        MedicalRecord(
          date: DateTime.now().subtract(Duration(days: 30)),
          title: 'Vaccination',
          details: 'Rabies shot',
        ),
      ],
    ),
  ];

  List<Pet> get pets => _pets;

  void addFeedingSchedule(String petId, FeedingSchedule schedule) {
    int index = _pets.indexWhere((pet) => pet.id == petId);
    if (index != -1) {
      _pets[index].feedingSchedules.add(schedule);
      notifyListeners();
    }
  }

  void addMedicalRecord(String petId, MedicalRecord record) {
    int index = _pets.indexWhere((pet) => pet.id == petId);
    if (index != -1) {
      _pets[index].medicalRecords.add(record);
      notifyListeners();
    }
  }
}