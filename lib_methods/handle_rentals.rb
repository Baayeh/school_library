require './rental'

module HandleRentals
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
