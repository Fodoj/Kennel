# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :static_page do
    name "MyString"
    slug "MyString"
    content "MyText"
  end
end
