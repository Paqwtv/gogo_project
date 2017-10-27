require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :author => "MyString",
      :title => "MyString",
      :description => "MyText",
      :date_time => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :private => false,
      :address => "MyString",
      :checked_by_as => 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[author]"

      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[date_time]"

      assert_select "input[name=?]", "event[latitude]"

      assert_select "input[name=?]", "event[longitude]"

      assert_select "input[name=?]", "event[private]"

      assert_select "input[name=?]", "event[address]"

      assert_select "input[name=?]", "event[checked_by_as]"
    end
  end
end
