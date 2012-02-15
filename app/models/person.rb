class Person < ActiveRecord::Base
  include Rolify::Roles
  # extend Rolify::Dynamic
  has_and_belongs_to_many :roles, :join_table => :people_roles
  has_many :pets

  scope :owners, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("owner").id)  }
  scope :breeders, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("breeder").id)  }
  scope :kennels, lambda{ Person.joins(:roles).where('people_roles.role_id' => Role.find_by_name("kennel").id)  }
end
