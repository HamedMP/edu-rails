# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    full_name "MyString"
    oauth_token "MyString"
    email "MyString"
  end
end
