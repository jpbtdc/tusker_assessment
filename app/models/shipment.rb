class Shipment < ApplicationRecord
  validates :customer_id, presence: true
  validates :requested_on, presence: true
  belongs_to :customer
end