class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_books
    @books.each { |book| puts book.title + " by " + book.author + " is " + book.status + "." }
      
    # neatly list name of books with author and their status
  end

  def borrowed_books # show list of books with their borrowers
    @books.each { |book| 
    if book.status == "checked out"
      puts book.title + " is checked out by #{book.borrower.name}."
    end
    }
  end

  def available_books
    @books.each { |book| 
    if book.status == "available"
      puts book.title + " is available."
    end
    }
    # show only those books with a status of checked_in
  end

  def add_book(book)
    @books << book  #adds book to books array within library
    puts "Your library now has #{book.title} by #{book.author}."
    # puts book.author
  end

  def check_out(user, book)
    # user = book.borrower
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

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    @borrowed_books.each { |book| 
      puts book.title + " by " + book.author + "."
    }
    # neatly list items in borrowed_books
  end
end

class Book
  attr_reader :title  #makes Book.title accessible throughout
  attr_reader :author #makes Book.author accessible throughout
  attr_accessor :status #makes Book.status accessible throughout
  attr_accessor :borrower #makes Book.borrower accessible throughout

  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end

  def status=(new_value)
    @status = new_value
  end

  def borrower=(new_value)
    @borrower = new_value
  end

end
