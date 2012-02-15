class Pet < ActiveRecord::Base
  has_many :pet_photos
  has_many :photos, :through => :pet_photos

  belongs_to :mother, :class_name => Pet
  belongs_to :father, :class_name => Pet
  has_many :children, :class_name => Pet

  accepts_nested_attributes_for :photos

  belongs_to :owner, :class_name => Person
  delegate :name, :to => :owner, :prefix => true

  belongs_to :breeder, :class_name => Person
  delegate :name, :to => :breeder, :prefix => true

  belongs_to :kennel, :class_name => Person
  delegate :name, :to => :kennel, :prefix => true

  scope :dogs, where(:sex => true)
  scope :bitches, where(:sex => false)

end
