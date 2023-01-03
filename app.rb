require_relative 'book'
require_relative 'lib_methods'

class App
  include Actions
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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
end
