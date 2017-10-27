require 'rails_helper'

RSpec.describe "qr_teches/new", type: :view do
  before(:each) do
    assign(:qr_tech, QrTech.new(
      :qr_code => "MyString"
    ))
  end

  it "renders new qr_tech form" do
    render

    assert_select "form[action=?][method=?]", qr_teches_path, "post" do

      assert_select "input[name=?]", "qr_tech[qr_code]"
    end
  end
end
