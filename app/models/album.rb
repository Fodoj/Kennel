class Album < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  validates :name, :presence => true
end
