class Person < ActiveRecord::Base
  rolify
  has_and_belongs_to_many :roles, :join_table => :people_roles
  has_many :pets_of_breeder, :class_name => "Pet", :foreign_key => "breeder_id"
  has_many :pets_of_owner, :class_name => "Pet", :foreign_key => "owner_id"
  has_many :pets_of_kennel, :class_name => "Pet", :foreign_key => "kennel_id"

  validates :name, :presence => true

  scope :owners, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("owner").id)  }
  scope :breeders, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("breeder").id)  }
  scope :kennels, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("kennel").id)  }

  def pets
    case roles.first.name
    when "owner"
      return pets_of_owner
    when "breeder"
      return pets_of_breeder
    when "kennel"
      return pets_of_kennel
    end
  end
end
