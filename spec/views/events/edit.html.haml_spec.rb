require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
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

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

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
