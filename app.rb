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

  # List App Menu
  def menu
    begin
      puts "Welcome to School Library App!"
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
    end while user_input != 7
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
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

end