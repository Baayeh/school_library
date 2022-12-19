require './person'

##
# A class representing a student
#
# The student inherits from the Person class
class Student < Person
  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
