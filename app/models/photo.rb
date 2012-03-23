class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => {
    :large => "900>x430",
    :medium => "220x175#",
    :slider => "568x372#",
    :thumb => "160x120#" }
  validates :caption, :length => { :maximum => 140}
  validates_attachment_presence :image
  validates_presence_of :image

  paginates_per 54

  has_many :pet_photos
  has_many :pets, :through => :pet_photos
  belongs_to :album

  scope :unsorted, where(:album_id => nil)
  scope :with_album, where('album_id != 0')

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE"
    }
  end

end
