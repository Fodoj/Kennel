class Pet < ActiveRecord::Base
  before_save :trim_texts

  has_many :pet_photos
  has_many :photos, :through => :pet_photos

  belongs_to :mother, :class_name => "Pet"
  belongs_to :father, :class_name => "Pet"
  has_many :children_of_father, :class_name => "Pet", :foreign_key => 'father_id'
  has_many :children_of_mother, :class_name => "Pet", :foreign_key => 'mother_id'

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
    :slider => "568x372#",
    :title => "380x255#",
    :pedigree_parent => "358x278#",
    :pedigree_grandparent => "168x96#",
    :pedigree_elder => "100x68#",
    :thumb => "172x140#" }, :default_url => "missing_thumb.png"

  scope :dogs, where(:sex => true)
  scope :puppies, where(:puppy => true)
  scope :bitches, where(:sex => false)
  scope :my, where(:owned => true)

  def parents
    [mother, father]
  end


  class << self
    def extend_parents(pets)
      elder = []

      pets.each do |pet|
        elder += pet.parents if pet.present?
      end

      elder
    end
  end

  def descendants
    descendants = self.children

    children.each do |child|
      descendants += child.children
    end

    descendants
  end

  def children
     children_of_mother + children_of_father
  end

  def next_photo(photo)
    photo = photos.where("photo_id > ?", photo.id).first
    return photo.nil? ? photos.first : photo
  end

  def prev_photo(photo)
    photo = photos.where("photo_id < ?", photo.id).first
    return photo.nil? ? photos.first : photo
  end

  private
    def trim_texts
      [self.description].each(&:strip!) if description.present?
    end
end
