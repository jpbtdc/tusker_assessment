require 'rails_helper'

RSpec.describe BoxContent, :type => :model do
  describe 'instance' do
    subject { BoxContent.new }

    it { is_expected.to respond_to(:code) }

    it { is_expected.to be_valid }
  end
end
