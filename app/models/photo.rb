class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_attached_file :image, :styles => {
    :large => "900x430#",
    :composer_large => "704x352#",
    :composer_medium => "352x352#",
    :composer_small => "176x176#",
    :medium => "220x175#",
    :admin_thumb => "270x175#",
    :slider => "568x372#",
    :thumb => "160x120#",
    :pet_title => "380x255#"
    }
  has_many :pet_photos
  has_many :pets, :through => :pet_photos
  has_and_belongs_to_many :albums, :uniq => true
  belongs_to :primary_album, :class_name => "Album"

  validates :caption, :length => { :maximum => 140}
  validates_attachment_presence :image
  validates_presence_of :image

  scope :unsorted, where(:album_id => nil) #FIXME
  scope :main, where(:on_main => true)

  paginates_per 54

  def to_jq_upload
    {
      "name" => image_file_name,
      "size" => image_file_size,
      "url" => image.url,
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => admin_photo_path(:id => id),
      "delete_type" => "DELETE",
      "id" => id
    }
  end

  def next_photo(album)
    photos = album.photos.order('id ASC')
    photo = photos.where("photo_id > ?", id).first
    return photo.nil? ? photos.first : photo
  end

  def prev_photo(album)
    photos = album.photos.order('id DESC')
    photo = photos.where("photo_id < ?", id).first
    return photo.nil? ? photos.first : photo
  end
end
