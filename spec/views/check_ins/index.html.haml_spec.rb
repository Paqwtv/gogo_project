require 'rails_helper'

RSpec.describe "check_ins/index", type: :view do
  before(:each) do
    assign(:check_ins, [
      CheckIn.create!(
        :sheck_in_url => false,
        :secret_key => false
      ),
      CheckIn.create!(
        :sheck_in_url => false,
        :secret_key => false
      )
    ])
  end

  it "renders a list of check_ins" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
