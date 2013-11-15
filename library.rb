class Library
  def initialize
    @books = []
  end

  def books
    @books
  end

  def list_books
    @books.each { |book| puts book.title + " by " + book.author + " is " + book.status}
      
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
    if user.borrowed_books.length == 2
      return "Sorry, that user already had two books checked out."
    end  

    if book.status == "available"
      book.borrower = user
      book.status = "checked out"
      # borrower.borrowed_books << book
    else 
      puts "Sorry, that book is not available"
    end

    # if (@books.include?(book)) 
    #   puts "#{book} is available for checkout to #{user}."
    # if book is still in library proceed with check out
    # else return, "That book is already checked out"
    #   or just return status of book
    # if Borrower has less than 2 books, check out book

    # and add to borrower's borrowed_books
    # If Borrower already has 2 books, do not allow check out and 
    # do not change status
    # end

  end

  def check_in(book)
  end
end

class Borrower

  def initialize(name)
    @name = name
    @books = []
  end

  def borrowed_books
    @borrowed_books = []
    #cannot contain more that two items in hash
  end

  def name
    @name   #makes Borrower.name accessible throughout
  end

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    # neatly list items in borrowed_books
  end
end

class Book
  attr_reader :title  #makes Book.title accessible throughout
  attr_reader :author #makes Book.author accessible throughout
  # attr_accessor :status #makes Book.status accessible throughout
  # attr_accessor :borrower #makes Book.borrower accessible throughout

  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end

  def status
    @status
  end

  def status=(new_value)
    @status = new_value
  end

  def borrower
    @borrower
  end

  def borrower=(new_value)
    @borrower = new_value
  end

end
