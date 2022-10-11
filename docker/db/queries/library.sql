-- а) Какие фамилии читателей в Москве?
SELECT reader.lastname FROM reader WHERE reader.address = 'Москва';

-- б) Какие книги (author, title) брал Иван Иванов?
SELECT DISTINCT book.author, book.title
FROM reader, bookrental, bookexemplar, book
WHERE
  reader.firstname = 'Иван'
  AND reader.lastname = 'Иванов'
  AND reader.id = bookrental.readerid
  AND bookrental.copynumber = bookexemplar.copynumber
  AND bookexemplar.isbn = book.isbn;

-- в) Какие книги (ISBN) из категории "Горы" не относятся к категории "Путешествия"? Подкатегории не обязательно принимать во внимание!
SELECT DISTINCT isbn FROM bookcat WHERE bookcat.category = 'Горы'
EXCEPT SELECT DISTINCT isbn FROM bookcat WHERE bookcat.category = 'Путешествия';

-- г) Какие читатели (LastName, FirstName) вернули копию книги?
SELECT DISTINCT reader.lastname, reader.firstname FROM reader, bookrental
WHERE reader.id = bookrental.readerid AND bookrental.returndate IS NOT NULL;

-- д) Какие читатели (LastName, FirstName) брали хотя бы одну книгу (не копию), которую брал также Иван Иванов (не включайте Ивана Иванова в результат)?
WITH ivan_isbns AS (
SELECT DISTINCT book.isbn
FROM reader, bookrental, bookexemplar, book
WHERE
  reader.firstname = 'Иван'
  AND reader.lastname = 'Иванов'
  AND reader.id = bookrental.readerid
  AND bookrental.copynumber = bookexemplar.copynumber
  AND bookexemplar.isbn = book.isbn
)
SELECT DISTINCT firstname, lastname
FROM reader, bookrental, bookexemplar, ivan_isbns
WHERE
  reader.firstname != 'Иван'
  AND reader.lastname != 'Иванов'
  AND reader.id = bookrental.readerid
  AND bookrental.copynumber = bookexemplar.copynumber
  AND bookexemplar.isbn = ivan_isbns.isbn
