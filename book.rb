class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  # Serialization
  def to_json(options = {})
    { title: @title, author: @author }.to_json(options)
  end
end
