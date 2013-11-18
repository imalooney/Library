class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  # List Books within books Array by their title, author, and status.

  def list_books
    @books.each { |book| puts book.title + " by " + book.author + " is " + book.status + "." }
  end

  # List each borrowed Book within Library's books Array with thier borrowers.

  def borrowed_books
    @books.each { |book| 
    if book.status == "checked out"
      puts book.title + " is checked out by #{book.borrower.name}."
    end
    }
  end

  # List each book within Library's books Array with a status of available.

  def available_books
    @books.each { |book| 
    if book.status == "available"
      puts book.title +  " by " + book.author +  " is available."
    end
    }
  end

  # Add book to Library's books Array by use of book name.

  def add_book(book)
    @books << book
    puts "Your library now has \"#{book.title}\" by #{book.author}."
  end

  # Do not allow check_out to user with 2 books.
  # If allowed, check that book is available.
  # If book is available, add to user's borrowed_books Array and change status for Book to checked-out.

  def check_out(user, book)
    if user.borrowed_books.length == 2
      return puts "Sorry, that user already has two books checked out!"
    end  

    if book.status == "available"
      book.borrower = user
      book.status = "checked out"
      user.borrowed_books << book
      puts "#{user.name} checked out #{book.title} by #{book.author}."
    else 
      puts "Sorry, that book is not available!"
    end

  end

  # Delete book by name from within the user's borrowed_books Array.
  # Change status of book in library Array back to "available".

  def check_in(book)
    book.borrower.borrowed_books.delete(book)
    book.status = "available"
    book.borrower = nil
    puts "Thank you for returning #{book.title}."
  end
end

class Borrower
  attr_reader :name
  attr_accessor :borrowed_books

  def initialize(name)
    @name = name
    @books = []
    @borrowed_books = []
  end

  # Count number of books user has checked out of Library.

  def borrowed_books_count
    @borrowed_books.length
  end

  # List books with the Borrower's borrowed_books Array.

  def borrowed_books_list
    @borrowed_books.each { |book| 
      puts book.title + " by " + book.author + "."
    }
  end
end

class Book
  attr_reader :title
  attr_reader :author
  attr_accessor :status
  attr_accessor :borrower
  attr_accessor :year_published
  attr_accessor :edition

  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
    @year_published = nil
    @edition = nil
  end

end
