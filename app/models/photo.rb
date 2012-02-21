class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => {
    :large => "600x600",
    :medium => "270x175#",
    :thumb => "160x120" }
  validates :caption, :length => { :maximum => 140}
  validates_attachment_presence :image
  validates_presence_of :image

  paginates_per 54

  has_many :pet_photos
  has_many :pets, :through => :pet_photos
  belongs_to :album
end
