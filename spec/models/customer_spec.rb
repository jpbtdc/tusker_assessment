require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe 'instance' do
    subject { Customer.new }
    it { is_expected.to respond_to(:name) }
  end
end
