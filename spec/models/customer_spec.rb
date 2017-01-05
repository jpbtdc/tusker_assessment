require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe 'instance' do
    subject { Customer.new(name: 'Anyone') }

    it { is_expected.to respond_to(:name) }

    it { is_expected.to be_valid }

    context 'when no name' do
      before { subject.name = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
