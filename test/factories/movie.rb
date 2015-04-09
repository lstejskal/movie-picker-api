include MoviePicker::Api::Models

FactoryGirl.define do

  factory :movie do
    name { Faker::Lorem.words(3).join(" ") }
  end

end
