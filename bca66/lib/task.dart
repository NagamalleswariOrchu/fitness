import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:your_app/models/category_model.dart';
import 'package:your_app/providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = '1'; // Default category ID

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              value: _selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value.toString();
                });
              },
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty || _amountController.text.isEmpty) {
                  return;
                }
                final enteredTitle = _titleController.text;
                final enteredAmount = double.parse(_amountController.text);

                Provider.of<ExpenseProvider>(context, listen: false)
                    .addExpense(enteredTitle, enteredAmount, _selectedDate, _selectedCategory);

                Navigator.of(context).pop();
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}