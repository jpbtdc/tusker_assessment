class ShipmentBox < ApplicationRecord
  validates :shipment_id, presence: true
  validates :box_id, presence: true, uniqueness: true
  belongs_to :shipment
  belongs_to :box
end
