class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false, unique: true
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
    end
  end
end
