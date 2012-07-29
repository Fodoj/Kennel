# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    event_id 1
    caption "MyText"
    image File.new("#{Rails.root}/db/sample/images/samplimg.jpg")
  end
end
