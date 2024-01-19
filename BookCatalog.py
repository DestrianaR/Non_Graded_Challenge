class BookCatalog:
    # List of books in the catalog
    books = []
    
    def __init__(self, title, author, identifier):
        self.title = title
        self.author = author
        self.identifier = identifier
    
    # Function to add a book to the catalog
    def addBook(self):
        for book in BookCatalog.books: 
            if book[2] == self.identifier: 
                raise ValueError(f"Book with ID {self.identifier} already exists")

        BookCatalog.books.append((self.title, self.author, self.identifier)) 

    # Function to search a book in catalog   
    def searchBook(self, keysearch):
        if len(BookCatalog.books) == 0:
            raise ValueError("Book catalog is empty")
        
        for book in BookCatalog.books:
            for bookIdentity in book:
                if bookIdentity.lower() == keysearch.lower():
                    return book
                
        raise Exception("This book is not found in the catalog")
    
    # Function to remove a book from the catalog          
    def removeBook(self, title):
        if len(BookCatalog.books) == 0:
            raise ValueError("Book catalog is empty")
        
        for book in BookCatalog.books:
            for bookIdentity in book:
                if bookIdentity.lower() == title.lower():
                    BookCatalog.books.remove(book)
                    
        raise Exception("This book is not found in the catalog") 
                   
    # Function to show a book in catalog
    def showCatalog(self):
        if len(BookCatalog.books) == 0:
            raise ValueError("Book catalog is empty")
        return BookCatalog.books