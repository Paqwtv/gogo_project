require 'rails_helper'

RSpec.describe "check_ins/show", type: :view do
  before(:each) do
    @check_in = assign(:check_in, CheckIn.create!(
      :sheck_in_url => false,
      :secret_key => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
