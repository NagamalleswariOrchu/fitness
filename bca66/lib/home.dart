import 'package:flutter/foundation.dart';

class Pet {
  final String id;
  final String name;
  final String breed;
  final String imageUrl;
  List<FeedingSchedule> feedingSchedules;
  List<MedicalRecord> medicalRecords;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.imageUrl,
    this.feedingSchedules = const [],
    this.medicalRecords = const [],
  });
}

class FeedingSchedule {
  final DateTime time;
  final String type;
  final String notes;

  FeedingSchedule({
    required this.time,
    required this.type,
    required this.notes,
  });
}

class MedicalRecord {
  final DateTime date;
  final String title;
  final String details;

  MedicalRecord({
    required this.date,
    required this.title,
    required this.details,
  });
}