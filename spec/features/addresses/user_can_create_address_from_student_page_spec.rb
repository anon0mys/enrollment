require 'rails_helper'

describe 'User' do
  context 'can create a new address' do
    scenario 'when on /students/:id/addresses/new path' do
      student = Student.create(name: 'Margaret')
      visit new_student_address_path(student)

      description = 'Summer Address'
      street = '1234 Abbey Road'
      city = 'Denver'
      state = 'Colorado'
      zip = '80235'

      fill_in 'Description', with: description
      fill_in 'Street', with: street
      fill_in 'City', with: city
      fill_in 'State', with: state
      fill_in 'Zipcode', with: zip
      click_on 'Submit'

      expect(current_path).to eq(student_path(student))
      expect(page).to have_content(description)
      expect(page).to have_content(street)
      expect(page).to have_content(city)
      expect(page).to have_content(state)
      expect(page).to have_content(zip)
    end
  end
end
