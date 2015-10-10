class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :profile_id, required: true
      t.string :profile_type, required: true
      t.string :name
      t.string :address
      t.string :phone
      t.string :location
      t.attachment :photo
      t.timestamps null: false
    end
  end
end
