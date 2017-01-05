class CreateShipmentBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_boxes do |t|
      t.references :shipment, foreign_key: true
      t.references :box, foreign_key: true
    end
  end
end
