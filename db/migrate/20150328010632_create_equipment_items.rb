class CreateEquipmentItems < ActiveRecord::Migration
  def change
    create_table :equipment_items do |t|
      t.string :name, null: false
      t.boolean :owned, null: false
      t.float :rental_rate
      t.float :cost
      t.integer :event_id
    end
  end
end
