require 'rails_helper'

RSpec.describe "check_ins/edit", type: :view do
  before(:each) do
    @check_in = assign(:check_in, CheckIn.create!(
      :sheck_in_url => false,
      :secret_key => false
    ))
  end

  it "renders the edit check_in form" do
    render

    assert_select "form[action=?][method=?]", check_in_path(@check_in), "post" do

      assert_select "input[name=?]", "check_in[sheck_in_url]"

      assert_select "input[name=?]", "check_in[secret_key]"
    end
  end
end
