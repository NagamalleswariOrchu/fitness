import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';

class AddItemScreen extends StatefulWidget {
  final Function(Item) addItem;

  AddItemScreen({required this.addItem});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _itemController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String itemId = DateTime.now().millisecondsSinceEpoch.toString();
                String itemName = _itemController.text;
                if (itemName.isNotEmpty) {
                  widget.addItem(Item(id: itemId, name: itemName));
                  Navigator.pop(context);
                }
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}