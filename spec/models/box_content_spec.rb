require 'rails_helper'

RSpec.describe BoxContent, :type => :model do
  describe 'instance' do
    subject { BoxContent.new(code: 'XX') }

    it { is_expected.to respond_to(:code) }

    it { is_expected.to be_valid }

    context 'when no code' do
      before { subject.code = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
