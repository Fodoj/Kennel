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

  paginates_per 20

  def cover
    if has_photo?
      photo
    elsif has_album?
      album.photos.first.image
    else
      nil
    end
  end

  private
    def has_photo?
      photo.present?
    end

    def has_album?
      album.present?
    end

    def trim_texts
      [self.body, self.preview].each(&:strip!)
    end
end
