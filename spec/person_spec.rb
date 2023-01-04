require 'spec_helper'

# Test for Person class
describe Person do
  describe '#initialize' do
    it 'Creates an instance of a person with name and age' do
      person = Person.new(30, 'Okechukwu')
      expect(person).to be_instance_of Person
    end
  end

  describe '#name' do
    it 'returns a name of a person' do
      person = Person.new(30, 'Okechukwu')
      expect(person.name).to eq 'Okechukwu'
    end
  end

  describe '#age' do
    it 'returns the age of the person' do
      person = Person.new(30, 'Okechukwu')
      expect(person.age).to be_kind_of Numeric
    end
  end

  describe '#can_use_services?' do
    it 'should return true' do
      person = Person.new(30, 'Okechukwu')
      expect(person.can_use_services?).to be true
    end
  end
end
