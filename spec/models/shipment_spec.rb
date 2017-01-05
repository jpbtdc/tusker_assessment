require 'rails_helper'

RSpec.describe Shipment, :type => :model do
  describe 'instance' do
    let(:customer) { Customer.create!(name: 'Anyone') }
    subject { Shipment.new(customer_id: customer.id) }

    it { is_expected.to respond_to(:customer_id) }
    it { is_expected.to respond_to(:delivery_city) }
    it { is_expected.to respond_to(:requested_on) }
    it { is_expected.to respond_to(:sent_on) }
    it { is_expected.to respond_to(:received_on) }

    it { is_expected.to be_valid }

    context 'when no customer' do
      before { subject.customer_id = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
