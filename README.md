# README

#Book Borrowing Api

#Books
GET  /books - display all books
POST /books - params - title, author, pages - Create Book Title
PUT /books/{id} - params - title, author, pages - Update Specific Book
DELETE /books{id} - Delete Book

Borrowing
GET /books/{id}/borrows - displays borows from current book
POST /books/{id}/borrows - params name, returned - add name of borrower
PUT /books/{id}/borrows/{borrow_id} - params returned - updates if book is returned by borrower
DELETE /books/{id}/borrows/{borrow_id} - deletes borrowed book data

