class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :profile_id, required: true
      t.string :profile_type, required: true
      t.string :name
      t.string :username
      t.date :dob
      t.string :location
      t.timestamps null: false
    end
  end
end
