require 'rails_helper'

describe 'User' do
  context 'can see a list of students' do
    scenario 'when on /students path' do
      student_one = Student.create(name: 'Ian')
      student_two = Student.create(name: 'Ali')
      student_three = Student.create(name: 'Mike Dao')

      visit students_path

      expect(page).to have_content(student_one.name)
      expect(page).to have_content(student_two.name)
      expect(page).to have_content(student_three.name)
    end
  end

  context 'can use links to navigate' do
    scenario 'student name links to show page' do
      student_one = Student.create(name: 'Ian')
      student_two = Student.create(name: 'Ali')
      visit students_path
      click_on "#{student_one.name}"

      expect(current_path).to eq(student_path(student_one))

      visit students_path
      click_on "#{student_two.name}"

      expect(current_path).to eq(student_path(student_two))
    end
  end
end
