require 'rspec'

# Unit test for Student class
require_relative '../student'

describe Student do
  describe '#initialize' do
    it 'Creates an instance of Student with a age, classroom, name and parent_permission' do
      student = Student.new(25, 3, 'Okechukwu', parent_permission: true)
      expect(student).to be_instance_of Student
    end
  end

  describe '#age' do
    it 'returns the age property of the student' do
      student = Student.new(25, 3, 'Okechukwu', parent_permission: true)
      expect(student.age).to eq 25
    end
  end

  describe '#classroom' do
    it 'return the classroom property of the student' do
      student = Student.new(25, 3, 'Okechukwu', parent_permission: true)
      expect(student.classroom).to eq 3
    end
  end

  describe '#name' do
    it 'returns the name property of the student' do
      student = Student.new(25, 3, 'Okechukwu', parent_permission: true)
      expect(student.name).to eq 'Okechukwu'
    end
  end
end
