require './student'
require './teacher'

module HandlePeople
  def list_people
    if @people.empty?
      puts 'No person available'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
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
    puts 'Teacher created successfullly'
  end
end
