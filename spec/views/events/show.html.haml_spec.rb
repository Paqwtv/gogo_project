require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :author => "Author",
      :title => "Title",
      :description => "MyText",
      :date_time => "Date Time",
      :latitude => 2.5,
      :longitude => 3.5,
      :private => false,
      :address => "Address",
      :checked_by_as => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Date Time/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/4/)
  end
end
