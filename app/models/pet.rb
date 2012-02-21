class Pet < ActiveRecord::Base
  has_many :pet_photos
  has_many :photos, :through => :pet_photos

  belongs_to :mother, :class_name => Pet
  belongs_to :father, :class_name => Pet
  has_many :children, :class_name => Pet

  accepts_nested_attributes_for :photos, :allow_destroy => true

  belongs_to :owner, :class_name => "Person"
  delegate :name, :to => :owner, :prefix => true

  belongs_to :breeder, :class_name => "Person"
  delegate :name, :to => :breeder, :prefix => true

  belongs_to :kennel, :class_name => "Person"
  delegate :name, :to => :kennel, :prefix => true

  validates :name, :presence => true

  has_attached_file :avatar, :styles => {
    :large => "600x600",
    :medium => "270x175#",
    :thumb => "120x120" }

  scope :dogs, where(:sex => true)
  scope :bitches, where(:sex => false)

end
