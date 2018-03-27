require 'rails_helper'

describe 'User' do
  context 'can see a list of courses' do
    scenario 'when on /students/:id path' do
      student = Student.create(name: 'Ian')
      course_one = Course.create(name: 'Design Basics')
      course_two = Course.create(name: 'Database Normalization')
      course_three = Course.create(name: 'Ruby Rocks')
      StudentCourse.create(student_id: student.id,
                           course_id: course_one.id)
      StudentCourse.create(student_id: student.id,
                           course_id: course_two.id)
      StudentCourse.create(student_id: student.id,
                           course_id: course_three.id)

      visit student_path(student)

      expect(page).to have_content(course_one.name)
      expect(page).to have_content(course_two.name)
      expect(page).to have_content(course_three.name)
    end
  end
end
