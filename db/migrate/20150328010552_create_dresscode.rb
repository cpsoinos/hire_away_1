class CreateDresscode < ActiveRecord::Migration
  def change
    create_table :dresscodes do |t|
      t.string :name, null: false
      t.integer :event_id, null: false
      t.integer :position_id, null: false
    end
  end
end
