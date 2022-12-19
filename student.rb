require_relative('./person')

class Student < Person
  attr_accessor :classroom

  def initialize(*args, classroom, **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
