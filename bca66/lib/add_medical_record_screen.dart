import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'pet_provider.dart';
import 'pet_model.dart';

class AddMedicalRecordScreen extends StatefulWidget {
  final String petId;

  AddMedicalRecordScreen({required this.petId});

  @override
  _AddMedicalRecordScreenState createState() => _AddMedicalRecordScreenState();
}

class _AddMedicalRecordScreenState extends State<AddMedicalRecordScreen> {
  DateTime _selectedDateTime = DateTime.now();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Medical Record')),
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
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Details'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text.trim();
                String details = _detailsController.text.trim();
                if (title.isNotEmpty && details.isNotEmpty) {
                  Provider.of<PetProvider>(context, listen: false).addMedicalRecord(
                    widget.petId,
                    MedicalRecord(date: _selectedDateTime, title: title, details: details),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Add Medical Record'),
            ),
          ],
        ),
      ),
    );
  }
}