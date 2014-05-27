# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "MyString"
    slug "MyString"
    order 1
    category nil
  end
end
