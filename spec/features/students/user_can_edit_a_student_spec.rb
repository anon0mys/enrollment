require 'rails_helper'

describe 'User' do
  context 'can edit student' do
    scenario 'when on /students/:id/edit path' do
      student = Student.create(name: 'Adam')
      visit student_path(student)

      expect(page).to have_content('Adam')

      visit edit_student_path(student)

      fill_in 'Name', with: 'Kelly'
      click_on 'Submit'

      expect(current_path).to eq(student_path(student.id))
      expect(page).to have_content('Kelly')
    end
  end
end
