require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(name: 'Anyone'))
  end

  it "renders attributes in <p>" do
    render
  end
end
