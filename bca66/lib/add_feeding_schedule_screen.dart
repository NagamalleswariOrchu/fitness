import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'pet_provider.dart';
import 'pet_model.dart';

class AddFeedingScheduleScreen extends StatefulWidget {
  final String petId;

  AddFeedingScheduleScreen({required this.petId});

  @override
  _AddFeedingScheduleScreenState createState() => _AddFeedingScheduleScreenState();
}

class _AddFeedingScheduleScreenState extends State<AddFeedingScheduleScreen> {
  DateTime _selectedDateTime = DateTime.now();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _typeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Feeding Schedule')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) {
                    setState(() {
                      _selectedDateTime = date;
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: Text('Select Date & Time'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Type'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String type = _typeController.text.trim();
                String notes = _notesController.text.trim();
                if (type.isNotEmpty && notes.isNotEmpty) {
                  Provider.of<PetProvider>(context, listen: false).addFeedingSchedule(
                    widget.petId,
                    FeedingSchedule(time: _selectedDateTime, type: type, notes: notes),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Add Feeding Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}