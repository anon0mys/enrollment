require 'rails_helper'

describe 'User' do
  context 'can see all student addresses' do
    scenario 'when on /students/:id path' do
      student = Student.create(name: 'Margaret')
      address_one = student.addresses.create(description: 'Summer Address',
                                             street: '1234 Abbey Road',
                                             city: 'Denver',
                                             state: 'Colorado',
                                             zipcode: '80235')
      address_two = student.addresses.create(description: 'Fall Address',
                                             street: '1234 Abbey Road',
                                             city: 'Denver',
                                             state: 'Colorado',
                                             zipcode: '80235')
      address_three = student.addresses.create(description: 'Safehouse Address',
                                               street: '1234 Abbey Road',
                                               city: 'Denver',
                                               state: 'Colorado',
                                               zipcode: '80235')

      visit student_path(student)

      expect(page).to have_content(address_one.description)
      expect(page).to have_content(address_two.description)
      expect(page).to have_content(address_three.description)
    end
  end
end
