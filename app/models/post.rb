class Post < ActiveRecord::Base
  has_attached_file :photo, :styles => {
    :large => "600x600",
    :medium => "270x175#",
    :thumb => "160x120" }

  belongs_to :album

  validates :title, :presence => true
  validates :body, :presence => true
end
