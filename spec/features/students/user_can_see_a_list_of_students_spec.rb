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
end
