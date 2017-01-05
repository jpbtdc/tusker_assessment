require 'rails_helper'

RSpec.describe Shipment, :type => :model do
  describe 'instance' do
    subject { Shipment.new }

    it { is_expected.to respond_to(:customer_id) }
    it { is_expected.to respond_to(:delivery_city) }
    it { is_expected.to respond_to(:requested_on) }
    it { is_expected.to respond_to(:sent_on) }
    it { is_expected.to respond_to(:received_on) }

    it { is_expected.to be_valid }
  end
end
