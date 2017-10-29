FactoryBot.define do
  factory :event do
    author "MyString"
    title "MyString"
    description "MyText"
    date_time "MyString"
    latitude 1.5
    longitude 1.5
    private false
    address "MyString"
    checked_by_as 1
  end
end
