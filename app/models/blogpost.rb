class Blogpost < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  belongs_to :staff
  belongs_to :blogable, polymorphic: true

  validates :staff_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :subtitle, presence: true
  validates :content, presence: true
  validate  :picture_size

  default_scope -> { order(created_at: :desc) }
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
