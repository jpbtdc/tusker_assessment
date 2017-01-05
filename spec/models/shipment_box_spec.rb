require 'rails_helper'

RSpec.describe ShipmentBox, :type => :model do
  describe 'class' do
    it { expect(ShipmentBox.reflect_on_association(:shipment).macro).to eq :belongs_to }
    it { expect(ShipmentBox.reflect_on_association(:box).macro).to eq :belongs_to }
  end

  describe 'instance' do
    let(:customer) { Customer.create!(name: 'Anyone') }
    let(:shipment) { Shipment.create!(customer_id: customer.id, requested_on: 1.week.ago) }
    let(:box)      { Box.create!(code: 'XX') }
    subject { ShipmentBox.new(shipment_id: shipment.id, box_id: box.id) }

    it { is_expected.to respond_to(:shipment_id) }
    it { is_expected.to respond_to(:box_id) }

    it { is_expected.to be_valid }

    context 'when no shipment' do
      before { subject.shipment_id = nil }
      it { is_expected.to_not be_valid }
    end

    context 'when no box' do
      before { subject.box_id = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
