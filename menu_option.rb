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
