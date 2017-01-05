require 'rails_helper'

RSpec.describe Shipment, :type => :model do
  describe 'class' do
    it { expect(Shipment.reflect_on_association(:customer).macro).to eq :belongs_to }
    it { expect(Shipment.reflect_on_association(:shipment_boxes).macro).to eq :has_many }
  end

  describe 'instance' do
    let(:customer) { Customer.create!(name: 'Anyone') }
    subject { Shipment.new(customer_id: customer.id, requested_on: 1.week.ago) }

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

    context 'when no requested on' do
      before { subject.requested_on = nil }
      it { is_expected.to_not be_valid }
    end

    context 'when requested in the future' do
      before { subject.requested_on = Time.now + 1.day }
      it { is_expected.to_not be_valid }
    end

    context 'when sent in the future' do
      before { subject.sent_on = Time.now + 1.day }
      it { is_expected.to_not be_valid }
    end

    context 'when received in the future' do
      before do
        subject.sent_on = subject.requested_on + 6.days
        subject.received_on = Time.now + 1.day
      end
      it { is_expected.to_not be_valid }
    end

    context 'when sent before requested' do
      before { subject.sent_on = subject.requested_on - 1.day }
      it { is_expected.to_not be_valid }
    end

    context 'when received but not sent' do
      before do
        subject.sent_on = nil
        subject.received_on = 1.day.ago
      end
      it { is_expected.to_not be_valid }
    end

    context 'when received before sent' do
      before do
        subject.sent_on = subject.requested_on + 6.days
        subject.received_on = subject.sent_on - 1.day
      end
      it { is_expected.to_not be_valid }
    end

    context 'when sent but no delivery city' do
      before do
        subject.sent_on = subject.requested_on + 6.days
        subject.delivery_city = nil
      end
      it { is_expected.to_not be_valid }
    end
  end
end
