# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create( [{ name: "owner"}, { name: "breeder"}, { name: "kennel"}] )

Person.create :name => ROOT_USER

Photo.create :id => 1, :caption => "Test image", :image_file_name => "samplimg.jpg", :image_content_type => "image/jpeg", :image_file_size => 8387, :on_main => false
