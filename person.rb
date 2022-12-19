##
# A class representing a person
#
# @attr_reader [Integer] id is the unique id assigned to each person instance
# @attr_accessor [String] name is the name of each person instance
# @attr_accessor [Interger] name is the age of each person instance
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    true if is_of_age? || @parent_permission
  end
end
