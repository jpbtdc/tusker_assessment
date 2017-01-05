class BoxContent < ApplicationRecord
  validates :box_id, presence: true
  validates :code, presence: true
end
