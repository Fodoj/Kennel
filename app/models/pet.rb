class Pet < ActiveRecord::Base
  has_many :pet_photos
  has_many :photos, :through => :pet_photos

  belongs_to :mother, :class_name => "Pet"
  belongs_to :father, :class_name => "Pet"
  has_many :children_of_father, :class_name => "Pet", :foreign_key => 'father_id'
  has_many :children_of_mother, :class_name => "Pet", :foreign_key => 'mother_id'

  has_attached_file :avatar, :styles => {
    :large => "600x600",
    :medium => "270x175#",
    :slider => "568x372#",
    :title => "380x255#",
    :pedigree_parent => "358x278#",
    :pedigree_grandparent => "168x96#",
    :pedigree_elder => "100x68#",
    :thumb => "172x140#" }, :default_url => "missing_thumb.png"

  belongs_to :owner, :class_name => "Person"
  belongs_to :breeder, :class_name => "Person"
  belongs_to :kennel, :class_name => "Person"

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :owner

  delegate :name, :to => :owner, :prefix => true
  delegate :name, :to => :breeder, :prefix => true
  delegate :name, :to => :kennel, :prefix => true

  validates :name, :presence => true

  before_save :trim_texts

  scope :dogs, where(:sex => true)
  scope :puppies, where(:puppy => true)
  scope :bitches, where(:sex => false)
  scope :my, where(:owned => true)

  class << self
    def extend_parents(pets)
      elder = []

      pets.each do |pet|
        elder += pet.parents if pet.present?
      end

      elder
    end
  end

  def parents
    [mother, father]
  end

  def descendants
    children + children.map(&:children).flatten
  end

  def children
     children_of_mother + children_of_father
  end

  def next_photo(photo)
    photos.where("photo_id > ?", photo.id).first || photos.first
  end

  def prev_photo(photo)
    photo = photos.where("photo_id < ?", photo.id).first
    return photo.nil? ? photos.first : photo
  end


  def assign_person(person_type, person_name)
    return unless person_type.present? & person_name.present?

    person = Person.find_or_create_by_name(person_name)
    update_attribute(person_type, person)
    person.has_role(person_type)
  end

  def assign_persons(persons = {})
    persons.each do |person_type, person_name|
      assign_person(person_type, person_name)
    end
  end

  def assign_parents(mather_name, father_name)
    if mather_name.present?
      update_attribute(:mother, Pet.find_or_create_by_name_and_sex(mather_name, false))
    end

    if father_name.present?
      update_attribute(:father, Pet.find_or_create_by_name_and_sex(father_name, true))
    end
  end

  private
    def trim_texts
      [self.description].each(&:strip!) if description.present?
    end

end
