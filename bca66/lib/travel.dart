import 'package:flutter/material.dart';
import 'package:your_app/models/destination.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard(this.destination);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(destination.imageUrl),
        ),
        title: Text(destination.name),
        subtitle: Text(destination.location),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationDetailScreen(destination)),
          );
        },
      ),
    );
  }
}
