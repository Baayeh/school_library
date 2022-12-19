# frozen_string_literal: true

require './person'

##
# A class representing a teacher
#
# The teacher inherits from the Person class
class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
