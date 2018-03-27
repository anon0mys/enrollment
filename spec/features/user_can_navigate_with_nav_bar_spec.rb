require 'rails_helper'

describe 'User' do
  context 'can use links to navigate' do
    scenario 'Students links to students index' do
      student_one = Student.create(name: 'Ian')
      student_two = Student.create(name: 'Ali')
      visit student_path(student_one)
      click_on 'Students'

      expect(current_path).to eq(students_path)

      visit new_student_path
      click_on 'Students'

      expect(current_path).to eq(students_path)
    end

    scenario 'New Student links to students/new' do
      student_one = Student.create(name: 'Ian')
      student_two = Student.create(name: 'Ali')
      visit students_path
      click_on "New Student"

      expect(current_path).to eq(new_student_path)

      visit student_path(student_one)
      click_on "New Student"

      expect(current_path).to eq(new_student_path)
    end
  end
end
