import 'package:flutter/material.dart';
import 'package:book_library/models/book.dart';

class AddEditBookScreen extends StatefulWidget {
  final bool editMode;
  final Book? book;
  final Function(Book) addBook;
  final Function(Book) editBook;

  AddEditBookScreen({
    required this.editMode,
    this.book,
    required this.addBook,
    required this.editBook,
  });

  @override
  _AddEditBookScreenState createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends State<AddEditBookScreen> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _authorController = TextEditingController(text: widget.book?.author ?? '');
    _imageUrlController =
        TextEditingController(text: widget.book?.imageUrl ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editMode ? 'Edit Book' : 'Add Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String id = widget.book?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
                String title = _titleController.text;
                String author = _authorController.text;
                String imageUrl = _imageUrlController.text;

                if (widget.editMode) {
                  widget.editBook(
                    (id: id, title: title, author: author, imageUrl: imageUrl),
                  );
                } else {
                  widget.addBook(
                    Book(id: id, title: title, author: author, imageUrl: imageUrl),
                  );
                }

                Navigator.pop(context);
              },
              child: Text(widget.editMode ? 'Save Changes' : 'Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}