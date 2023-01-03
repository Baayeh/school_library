class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    person.rentals << self
    book.rentals << self
  end

  # Serialization
  def to_json(options = {})
    { date: @date, book: @book, person: @person }.to_json(options)
  end
end
