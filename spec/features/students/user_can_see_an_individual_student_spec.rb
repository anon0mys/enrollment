require 'rails_helper'

describe 'User' do
  context 'can see an individual student' do
    scenario 'when on /students/:id path' do
      student = Student.create(name: 'Ian')

      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end
