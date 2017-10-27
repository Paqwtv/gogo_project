require 'rails_helper'

RSpec.describe "qr_teches/index", type: :view do
  before(:each) do
    assign(:qr_teches, [
      QrTech.create!(
        :qr_code => "Qr Code"
      ),
      QrTech.create!(
        :qr_code => "Qr Code"
      )
    ])
  end

  it "renders a list of qr_teches" do
    render
    assert_select "tr>td", :text => "Qr Code".to_s, :count => 2
  end
end
