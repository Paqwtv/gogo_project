require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :author => "Author",
        :title => "Title",
        :description => "MyText",
        :date_time => "Date Time",
        :latitude => 2.5,
        :longitude => 3.5,
        :private => false,
        :address => "Address",
        :checked_by_as => 4
      ),
      Event.create!(
        :author => "Author",
        :title => "Title",
        :description => "MyText",
        :date_time => "Date Time",
        :latitude => 2.5,
        :longitude => 3.5,
        :private => false,
        :address => "Address",
        :checked_by_as => 4
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Date Time".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
