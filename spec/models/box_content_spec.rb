require 'rails_helper'

RSpec.describe BoxContent, :type => :model do
  describe 'class' do
    it { expect(BoxContent.reflect_on_association(:box).macro).to eq :belongs_to }
  end

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

    context 'when content already exists within a box' do
      before do
        content = BoxContent.create!(box_id: box.id, code: 'AA')
        subject.box_id = box.id
        subject.code = content.code
      end
      it { is_expected.to_not be_valid }
    end

    context 'when content already exists in another box' do
      before do
        box2 = Box.create!(code: 'YY')
        content = BoxContent.create!(box_id: box.id, code: 'AA')
        subject.box_id = box2.id
        subject.code = content.code
      end
      it { is_expected.to be_valid }
    end
  end
end
