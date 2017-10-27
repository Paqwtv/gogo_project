require 'rails_helper'

RSpec.describe "snoopers/new", type: :view do
  before(:each) do
    assign(:snooper, Snooper.new(
      :facebook_token => "MyString",
      :facebook_event_url => "MyString"
    ))
  end

  it "renders new snooper form" do
    render

    assert_select "form[action=?][method=?]", snoopers_path, "post" do

      assert_select "input[name=?]", "snooper[facebook_token]"

      assert_select "input[name=?]", "snooper[facebook_event_url]"
    end
  end
end
