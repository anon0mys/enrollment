require 'rails_helper'

describe 'User' do
  context 'can see a list of students' do
    scenario 'when on /courses/:id path' do
      course = Course.create(name: 'Design Basics')
      student_one = Student.create(name: 'Ian')
      student_two = Student.create(name: 'Ali')
      student_three = Student.create(name: 'Mike Dao')
      StudentCourse.create(student_id: student_one.id,
                           course_id: course.id)
      StudentCourse.create(student_id: student_two.id,
                           course_id: course.id)
      StudentCourse.create(student_id: student_three.id,
                           course_id: course.id)

      visit course_path(course)

      expect(page).to have_content(student_one.name)
      expect(page).to have_content(student_two.name)
      expect(page).to have_content(student_three.name)
    end
  end
end
