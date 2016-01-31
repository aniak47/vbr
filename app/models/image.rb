class Image < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  
  belongs_to :imageable, polymorphic: true
  
  validate  :picture_size
  validates :picture, presence: true
  
  scope :carousel, -> { where(catergory: 'carousel') } 
  
    
    private
    
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
