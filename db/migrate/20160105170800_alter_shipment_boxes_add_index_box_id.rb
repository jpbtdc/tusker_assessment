class AlterShipmentBoxesAddIndexBoxId < ActiveRecord::Migration[5.0]
  def change
    remove_index :shipment_boxes, :box_id
    add_index :shipment_boxes, :box_id, unique: true
  end
end
