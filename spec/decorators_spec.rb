require 'spec_helper'

describe CapitalizeDecorator do
  it 'should capitalize the name' do
    person = Person.new(30, 'okechukwu')
    decorator = CapitalizeDecorator.new(person)
    expect(decorator.correct_name).to eql 'Okechukwu'
  end
end

describe TrimmerDecorator do
  it 'should trim some characters off' do
    person = Person.new(25, 'chukwuemekalum')
    decorator = TrimmerDecorator.new(person)
    expect(decorator.correct_name).to eql 'chukwuemek'
  end
end
