require 'rails_helper'

RSpec.describe "qr_teches/show", type: :view do
  before(:each) do
    @qr_tech = assign(:qr_tech, QrTech.create!(
      :qr_code => "Qr Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Qr Code/)
  end
end
