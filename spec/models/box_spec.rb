require 'rails_helper'

RSpec.describe Box, :type => :model do
  describe 'instance' do
    subject { Box.new }

    it { is_expected.to respond_to(:code) }

    it { is_expected.to be_valid }
  end
end
