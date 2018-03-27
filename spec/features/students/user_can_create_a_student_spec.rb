require 'rails_helper'

describe 'User' do
  context 'can create a new student' do
    scenario 'when on /students/new path' do
      visit new_student_path

      fill_in 'Name', with: 'Kelly'
      click_on 'Submit'

      expect(current_path).to eq(student_path(1))
      expect(page).to have_content('Kelly')
    end
  end
end
