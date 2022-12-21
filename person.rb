require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    true if of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
