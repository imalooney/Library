class Library
  def initialize
    @books = []
  end

  def books
    @books
  end

  def list_books
    # neatly list name of books with author and their status
  end

  def borrowed_books
    # show list of books with their borrowers
  end

  def available_books
    # show only those books with a status of checked_in
  end

  def add_book(book)
    @books << book  #adds book to books array within library
    puts "Your library now has #{book.title} by #{book.author}."
    # puts book.author
  end

  def check_out(user, book)
    # if book is still in library proceed with check out
    # else return, "That book is already checked out"
    #   or just return status of book
    # if Borrower has less than 2 books, check out book
    # and add to borrower's borrowed_books
    # If Borrower already has 2 books, do not allow check out and 
    # do not change status

  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
  end

  def borrowed_books

    #cannot contain more that two items in hash
  end

  def name
  end

  def borrowed_books_count
  end

  def borrowed_books_list
    # neatly list items in borrowed_books
  end
end

class Book
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    @title = title
    @author = author
  end

end
