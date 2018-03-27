require 'rails_helper'

describe 'User' do
  context 'when on /students/:id path' do
    scenario 'can delete a student' do
      student_one = Student.create(name: 'Adam')
      student_two = Student.create(name: 'Kolya')
      visit students_path

      expect(page).to have_content(student_one.name)
      expect(page).to have_content(student_two.name)

      within("li##{student_one.id}") do
        click_on 'Delete'
      end

      expect(current_path).to eq(students_path)
      expect(page).to_not have_content('Adam')
      expect(page).to have_content('Kolya')
    end

    scenario 'can delete a different student' do
      student_one = Student.create(name: 'Adam')
      student_two = Student.create(name: 'Kolya')
      visit students_path

      expect(page).to have_content(student_one.name)
      expect(page).to have_content(student_two.name)

      within("li##{student_two.id}") do
        click_on 'Delete'
      end

      expect(current_path).to eq(students_path)
      expect(page).to have_content('Adam')
      expect(page).to_not have_content('Kolya')
    end
  end
end
