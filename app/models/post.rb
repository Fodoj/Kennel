class Post < ActiveRecord::Base
  has_attached_file :photo, :styles => {
    :large => "600x600",
    :medium => "270x175#",
    :thumb => "160x120" }

  before_save :trim_texts

  belongs_to :album

  delegate :photos, :to => :album

  validates :title, :presence => true
  validates :body, :presence => true
  validates :preview, :length => { :maximum => 300}

  scope :with_preview, where("preview != ''")

  scope :event, where('album_id != 0')

  paginates_per 20

  def cover
    photo || first_album_photo
  end

  def first_album_photo
    if album && (photo = album.photos.first)
      photo.image
    end
  end

  def assign_album(photo_ids)
    if photo_ids && !photo_ids.empty?
      album = Album.find_or_create_by_name(title)
      album.update_attribute(:photo_ids, photo_ids)
      self.update_attribute(:album, album)
    end
  end

  private
    def trim_texts
      [self.body, self.preview].each(&:strip!)
    end
end
