class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.references :customer, foreign_key: true
      t.string     :delivery_city
      t.datetime   :requested_on
      t.datetime   :sent_on
      t.datetime   :received_on
    end
  end
end
