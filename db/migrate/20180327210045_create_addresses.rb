class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.references :student, foreign_key: true, index: true

      t.timestamps
    end
  end
end
