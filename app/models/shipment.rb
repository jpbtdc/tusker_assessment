class Shipment < ApplicationRecord
  validates :customer_id, presence: true
  validates :requested_on, presence: true
  validate :requested_cannot_be_in_the_future
  validate :sent_cannot_be_in_the_future
  validate :received_cannot_be_in_the_future
  validate :sent_cannot_be_before_requested
  validate :cannot_be_received_if_not_sent
  validate :received_cannot_be_before_sent
  validate :cannot_be_sent_if_no_delivery_city
  belongs_to :customer

  private

  def requested_cannot_be_in_the_future
    if requested_on.present? && requested_on > Time.now
      errors.add :requested_on, 'cannot be in the future'
    end
  end

  def sent_cannot_be_in_the_future
    if sent_on.present? && sent_on > Time.now
      errors.add :sent_on, 'cannot be in the future'
    end
  end

  def received_cannot_be_in_the_future
    if received_on.present? && received_on > Time.now
      errors.add :received_on, 'cannot be in the future'
    end
  end

  def sent_cannot_be_before_requested
    if sent_on.present? && requested_on.present? && sent_on < requested_on
      errors.add :sent_on, 'cannot be before requested on'
    end
  end

  def cannot_be_received_if_not_sent
    if received_on.present? && !sent_on.present?
      errors.add :received_on, 'cannot be set if no sent on'
    end
  end

  def received_cannot_be_before_sent
    if received_on.present? && sent_on.present? && received_on < sent_on
      errors.add :received_on, 'cannot be before sent on'
    end
  end

  def cannot_be_sent_if_no_delivery_city
    if sent_on.present? && !delivery_city.present?
      errors.add :delivery_city, 'cannot be set if no sent on'
    end
  end
end
