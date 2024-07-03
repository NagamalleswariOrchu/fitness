import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pet_model.dart';
import 'pet_provider.dart';
import 'pet_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pet Care App')),
      body: ListView.builder(
        itemCount: petProvider.pets.length,
        itemBuilder: (context, index) {
          Pet pet = petProvider.pets[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(pet.imageUrl),
            ),
            title: Text(pet.name),
            subtitle: Text(pet.breed),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetProfileScreen(pet: pet),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add pet screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}