class StaticPage < ActiveRecord::Base
  attr_accessible :content, :name, :slug
  validates :name, :uniqueness => true
  validates :slug, :uniqueness => true
end
