require_relative 'base_decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.capitalize
  end
end
