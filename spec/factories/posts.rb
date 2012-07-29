# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    album_id 1
    body "MyText"
    preview "Preview"
  end
end
