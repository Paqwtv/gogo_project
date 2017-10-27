require 'rails_helper'

RSpec.describe "qr_teches/edit", type: :view do
  before(:each) do
    @qr_tech = assign(:qr_tech, QrTech.create!(
      :qr_code => "MyString"
    ))
  end

  it "renders the edit qr_tech form" do
    render

    assert_select "form[action=?][method=?]", qr_tech_path(@qr_tech), "post" do

      assert_select "input[name=?]", "qr_tech[qr_code]"
    end
  end
end
