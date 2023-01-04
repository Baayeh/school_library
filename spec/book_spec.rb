require 'rspec'

# Book class testing
require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new Book instance with title and author' do
      my_book = Book.new 'Tempest', 'Shakespeare'
      expect(my_book).to be_instance_of Book
    end
    describe '#title' do
      it 'returns title of the title of a book' do
        my_book = Book.new 'Tempest', 'Shakespeare'
        expect(my_book.title).to eq 'Tempest'
      end
    end
    describe '#author' do
      it 'returns the author of a book' do
        my_book = Book.new 'Tempest', 'Shakespeare'
        expect(my_book.author).to eq 'Shakespeare'
      end
    end
  end
end
