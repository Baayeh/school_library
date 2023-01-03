require './student'
require './teacher'
require 'json'

module HandlePeople
  def list_people
    read_people
  end

  def person_selection
    print 'Do you want to create a student (1) or a teacher (2)?: '
    user_input = gets.chomp.to_i
    case user_input
    when 1
      create_student
    when 2
      create_teacher
    else puts 'Please select 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Does student have parent permission? [Y/N]: '
    permission = gets.chomp
    new_student = Student.new(age, permission, name)
    @people.push(new_student)
    save_data(new_student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    save_data(teacher)
    puts 'Teacher created successfullly'
  end

  def save_data(person)
    if File.exist?('./people.json')
      contents = File.read('./people.json')
      data = JSON.parse(contents)
      data << person
      json_data = data.to_json
      File.open('./people.json', 'w') do |file|
        file.puts(json_data)
      end
    else
      File.open('./people.json', 'w') do |file|
        data = @people.to_json
        file.puts(data)
      end
    end
  end

  # Reading file
  def read_people
    if File.exist?('people.json')
      people = File.read('people.json')
      people_array = JSON.parse(people)
      people_array.each do |person|
        puts "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      puts 'No person in database'
    end
  end
end
