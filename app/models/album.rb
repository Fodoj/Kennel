class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :post
  has_many :pets, :through => :photos, :uniq => true
  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates :name, :presence => true

  scope :event, where('post_id != 0')

  def assign_pets(pet_ids)
    if pet_ids
      pets = Pet.find(pet_ids)
      photos.each do |photo|
        photo.pets << pets
      end
    end
  end

  def assign_photos(photo_ids)
    if photo_ids
      photos << Photo.find(photo_ids)
    end
  end

end
