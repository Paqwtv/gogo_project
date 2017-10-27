require 'rails_helper'

RSpec.describe "snoopers/edit", type: :view do
  before(:each) do
    @snooper = assign(:snooper, Snooper.create!(
      :facebook_token => "MyString",
      :facebook_event_url => "MyString"
    ))
  end

  it "renders the edit snooper form" do
    render

    assert_select "form[action=?][method=?]", snooper_path(@snooper), "post" do

      assert_select "input[name=?]", "snooper[facebook_token]"

      assert_select "input[name=?]", "snooper[facebook_event_url]"
    end
  end
end
