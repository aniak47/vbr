class Blogpost < ActiveRecord::Base
  belongs_to :staff
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :staff_id, presence: true
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :content, presence: true
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
