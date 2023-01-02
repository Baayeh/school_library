require_relative 'book'
require_relative 'lib_methods'

class App
  include Actions
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts menu
  end
end
