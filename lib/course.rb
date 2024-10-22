class Course
  attr_reader :name, :professor, :students

  def initialize(name, professor)
    @name = name
    @professor = professor
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def groups_represented
    groups = []

    @students.each do |student|
      groups << student.group
    end

    groups.uniq!
  end
end
