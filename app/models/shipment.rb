class Shipment < ApplicationRecord
  validates :customer_id, presence: true
end
