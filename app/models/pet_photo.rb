class PetPhoto < ActiveRecord::Base
  belongs_to :pet
  belongs_to :photo
end
