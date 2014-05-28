# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    published_at "2014-05-27 23:11:02"
    body "MyText"
    is_featured false
    category
    expired_at "2014-05-27 23:11:02"
    is_vacancy false
  end
end
