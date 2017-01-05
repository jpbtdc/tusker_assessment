require 'rails_helper'

RSpec.describe BoxContent, :type => :model do
  describe 'instance' do
    let(:box) { Box.create!(code: 'XX') }
    subject { BoxContent.new(box_id: box.id, code: 'XX') }

    it { is_expected.to respond_to(:box_id) }
    it { is_expected.to respond_to(:code) }

    it { is_expected.to be_valid }

    context 'when no code' do
      before { subject.code = nil }
      it { is_expected.to_not be_valid }
    end

    context 'when no box' do
      before { subject.box_id = nil }
      it { is_expected.to_not be_valid }
    end
  end
end
