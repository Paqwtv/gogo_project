require 'rails_helper'

RSpec.describe "snoopers/show", type: :view do
  before(:each) do
    @snooper = assign(:snooper, Snooper.create!(
      :facebook_token => "Facebook Token",
      :facebook_event_url => "Facebook Event Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Facebook Token/)
    expect(rendered).to match(/Facebook Event Url/)
  end
end
