class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

  def group_all_students
    @courses.each do |course|
      course.students.each do |student|
        assign_to_group(student)
      end
    end
  end

  def names
    names = []

    @courses.each do |course|
      course.students.each do |student|
        if !names.include?(student.name)
          names << student.name
        end
      end
    end

    names
  end

  def students_by_group
    groups = Hash.new { |hash, key| hash[key] = [] }

    @courses.each do |course|
      course.students.each do |student|
        if !groups[student.group].include?(student)
          groups[student.group] << student
        end
      end
    end

    groups
  end
end
