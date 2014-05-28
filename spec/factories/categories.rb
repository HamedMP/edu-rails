# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "MyString"
    sequence(:slug)
    order 1
    parent nil
  end
end
