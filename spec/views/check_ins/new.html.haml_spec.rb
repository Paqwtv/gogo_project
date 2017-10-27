require 'rails_helper'

RSpec.describe "check_ins/new", type: :view do
  before(:each) do
    assign(:check_in, CheckIn.new(
      :sheck_in_url => false,
      :secret_key => false
    ))
  end

  it "renders new check_in form" do
    render

    assert_select "form[action=?][method=?]", check_ins_path, "post" do

      assert_select "input[name=?]", "check_in[sheck_in_url]"

      assert_select "input[name=?]", "check_in[secret_key]"
    end
  end
end
