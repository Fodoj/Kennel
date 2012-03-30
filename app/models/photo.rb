class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_attached_file :image, :styles => {
    :large => "900x430#",
    :medium => "220x175#",
    :admin_thumb => "270x175#",
    :slider => "568x372#",
    :thumb => "160x120#"
    }
  validates :caption, :length => { :maximum => 140}
  validates_attachment_presence :image
  validates_presence_of :image

  paginates_per 54

  has_many :pet_photos
  has_many :pets, :through => :pet_photos
  belongs_to :album

  scope :unsorted, where(:album_id => nil)
  scope :main, where(:on_main => true)
  scope :with_album, where('album_id != 0')

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

  def next_photo
    photos = album.photos.order('id ASC')
    photo = photos.where("id > ?", id).first
    return photo.nil? ? photos.first : photo
  end

  def prev_photo
    photos = album.photos.order('id DESC')
    photo = photos.where("id < ?", id).first
    return photo.nil? ? photos.first : photo
  end

end
