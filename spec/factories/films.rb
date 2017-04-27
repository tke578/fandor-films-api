require 'faker'
FactoryGirl.define do
  factory :film do
    title 		{ Faker::Name.name }
    description { Faker::Name.name }
    url_slug 	{ Faker::Internet.domain_name }
    year 		{ Faker::Number.number(4) }
    average_rating 3
  end
end
