require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user_name => "User Name",
        :gender => "Gender"
      ),
      Profile.create!(
        :user_name => "User Name",
        :gender => "Gender"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
  end
end
