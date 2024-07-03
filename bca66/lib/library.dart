
import 'package:flutter/material.dart';
import 'package:book_library/models/book.dart';
import 'package:book_library/screens/add_edit_book_screen.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book> books = [
    Book(
      id: '1',
      title: 'Flutter in Action',
      author: 'Eric Windmill',
      imageUrl: 'https://example.com/flutter_in_action.jpg',
    ),
    Book(
      id: '2',
      title: 'Clean Code',
      author: 'Robert C. Martin',
      imageUrl: 'https://example.com/clean_code.jpg',
    ),
    // Add more books as needed
  ];

  void _addBook(Book newBook) {
    setState(() {
      books.add(newBook);
    });
  }

  void _editBook(Book editedBook) {
    setState(() {
      int index = books.indexWhere((book) => book.id == editedBook.id);
      if (index != -1) {
        books[index] = editedBook;
      }
    });
  }

  void _deleteBook(String bookId) {
    setState(() {
      books.removeWhere((book) => book.id == bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          Book book = books[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(book.imageUrl),
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteBook(book.id),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditBookScreen(
                    editMode: true,
                    book: book,
                    editBook: _editBook,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditBookScreen(
                editMode: false,
                addBook: _addBook,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}