require 'rails_helper'

RSpec.describe "snoopers/index", type: :view do
  before(:each) do
    assign(:snoopers, [
      Snooper.create!(
        :facebook_token => "Facebook Token",
        :facebook_event_url => "Facebook Event Url"
      ),
      Snooper.create!(
        :facebook_token => "Facebook Token",
        :facebook_event_url => "Facebook Event Url"
      )
    ])
  end

  it "renders a list of snoopers" do
    render
    assert_select "tr>td", :text => "Facebook Token".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook Event Url".to_s, :count => 2
  end
end
