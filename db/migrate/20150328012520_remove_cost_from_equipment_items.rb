class RemoveCostFromEquipmentItems < ActiveRecord::Migration
  def up
    remove_column :equipment_items, :cost
  end
  def down
    add_column :equipment_items, :cost, :float
  end
end
