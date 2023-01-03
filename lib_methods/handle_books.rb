require './book'
require 'json'

module HandleBook
  def list_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    save_book(book)
    puts 'Book created successfullly'
  end

  # Saving books
  def save_book(book)
    if(File.exists?('./book.json'))
      file = File.read('./book.json')
      data = JSON.parse(file)
      data << book
      data_json = data.to_json
      File.open('./book.json', 'w') do |file|
        file.puts data_json
      end
    else
      File.open('./book.json', 'w') do |file|
        file.puts @books.to_json
      end
    end
  end   
end
