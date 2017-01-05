require 'rails_helper'

RSpec.describe Box, :type => :model do
  describe 'class' do
    it { expect(Box.reflect_on_association(:box_contents).macro).to eq :has_many }
  end

  describe 'instance' do
    subject { Box.new(code: 'XX') }

    it { is_expected.to respond_to(:code) }

    it { is_expected.to be_valid }

    context 'when no code' do
      before { subject.code = nil }
      it { is_expected.to_not be_valid }
    end

    context 'when code already exists' do
      before do
        box = Box.create!(code: 'AA')
        subject.code = box.code
      end
      it { is_expected.to_not be_valid }
    end
  end
end
