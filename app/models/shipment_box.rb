class ShipmentBox < ApplicationRecord
  validates :shipment_id, presence: true
  validates :box_id, presence: true
end
