class BoxContent < ApplicationRecord
  validates :box_id, presence: true
  validates :code, presence: true, uniqueness: { scope: :box_id }
  belongs_to :box
end
