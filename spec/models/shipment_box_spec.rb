require 'rails_helper'

RSpec.describe ShipmentBox, :type => :model do
  describe 'instance' do
    let(:customer) { Customer.create!(name: 'Anyone') }
    let(:shipment) { Shipment.new(customer_id: customer.id, requested_on: 1.week.ago) }
    let(:box)      { Box.create!(code: 'XX') }
    subject { ShipmentBox.new(shipment_id: shipment.id, box_id: box.id) }

    it { is_expected.to respond_to(:shipment_id) }
    it { is_expected.to respond_to(:box_id) }

    it { is_expected.to be_valid }
  end
end
