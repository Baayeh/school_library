require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts menu
  end

  # App Menu
  def menu
    puts 'Welcome to School Library App!'
    loop do
      puts ''
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      puts ''
      user_input = gets.chomp.to_i
      puts ''

      case user_input
      when 1..6 then run_option(user_input)
      when 7 then puts 'Thank you for using the app!'
      else puts 'Please enter valid option'
      end
      break unless user_input != 7
    end
  end

  def run_option(user_input)
    case user_input
    when 1
      puts 'List of books'
      puts '-' * 13
      list_books
      puts ''
    when 2
      puts 'List of people'
      puts '-' * 14
      list_people
      puts ''
    when 3
      puts 'Create a person'
      puts '-' * 16
      create_person
      puts ''
    when 4
      puts 'Create a book'
      puts '-' * 13
      create_book
      puts ''
    when 5
      puts 'Rent a book'
      puts '-' * 11
      rent_book
      puts ''
    when 6
      puts 'List of Rentals'
      puts '-' * 15
      list_rentals
      puts ''
    end
  end

  def list_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'No person available'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)?: '
    user_input = gets.chomp.to_i
    case user_input
    when 1
      create_student
    when 2
      create_teacher
    else puts 'Please select 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Does student have parent permission? [Y/N]: '
    permission = gets.chomp
    new_student = Student.new(age, permission, name)
    @people.push(new_student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfullly'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfullly'
  end

  def rent_book
    if @books.empty?
      puts 'No books available to rent out'
    elsif @people.empty?
      puts 'No person in database'
    else
      puts 'Select a book from the following list by number:'
      @books.each_with_index do |book, i|
        puts "#{i}) Title: #{book.title}, Author: #{book.author}"
      end
      puts ''
      book_index = gets.chomp.to_i
      book = @books[book_index]
      puts ''
      puts 'Select a person from the following list by number (not id):'
      @people.each_with_index do |person, i|
        puts "#{i} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      puts ''
      person_index = gets.chomp.to_i
      person = @people[person_index]
      puts ''
      print 'Date (YYYY/MM/DD): '
      date = gets.chomp
      new_rental = Rental.new(date, book, person)
      @rentals.push(new_rental)
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    puts 'Select ID of any person (Please type the number of the ID)'
    print 'ID of the person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      if id == rental.person.id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'ID does not exist'
      end
    end
  end
end
