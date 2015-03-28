class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.integer :user_id
      t.integer :event_id, null: false
      t.integer :position_id, null: false
    end
  end
end
