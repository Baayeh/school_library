require './rental'
require 'json'

module HandleRentals
  def rent_book
    if !File.exist?('book.json')
      puts 'No books available to rent out'
    elsif !File.exist?('people.json')
      puts 'No person in database'
    else
      puts 'Select a book from the following list by number:'
      books = File.read('book.json')
      book_array = JSON.parse(books)
      book_array.each_with_index do |book, i|
        puts "#{i} - Title: #{book['title']}, Author: #{book['author']}"
      end
      puts ''
      book_index = gets.chomp.to_i
      book = book_array[book_index]
      puts ''
      puts 'Select a person from the following list by number (not id):'
      people = File.read('people.json')
      people_array = JSON.parse(people)
      people_array.each_with_index do |person, i|
        puts "#{i} - [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
      puts ''
      person_index = gets.chomp.to_i
      person = people_array[person_index]
      puts ''
      print 'Date (YYYY/MM/DD): '
      date = gets.chomp
      new_rental = Rental.new(date, book, person)
      @rentals.push(new_rental)
      save_rentals(new_rental)
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    read_rental
  end

  def save_rentals(new_rental)
    if File.exist?('rentals.json')
      rentals = File.read('rentals.json')
      rental_array = JSON.parse(rentals)
      rental_array << new_rental
      data_json = rental_array.to_json
      File.open('rental.json', 'w') do |file|
        file.puts data_json
      end
    else
      File.open('rental.json', 'w') do |file|
        file.puts @rentals.to_json
      end
    end
  end

  # Reading Rentals from rental.json file
  def read_rental
    if File.exist?('rental.json')
      rental = File.read('rental.json')
      rental_array = JSON.parse(rental)
      rental_array.each do |rental|
        puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
      end
    else
      puts 'No rental in database'
    end
  end
end
