# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "MyString"
    sequence(:slug) { |n| "slug-#{n}" }
    order 1
    parent nil

    trait :parent do
      parent nil
    end
  end
end
