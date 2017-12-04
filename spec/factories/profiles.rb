FactoryBot.define do
  factory :profile do
    sequence(:user_name) {|n| "Profile#{n}"}
    sequence(:gender) {|n| ["Male", "Female"][rand(0..1)]}
  end
end