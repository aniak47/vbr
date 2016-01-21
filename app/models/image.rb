class Image < ActiveRecord::Base
    scope :carousel, -> { where(catergory: 'Carousel') } 
    mount_uploader :picture, PictureUploader
    validate  :picture_size
    validates :picture, presence: true
    belongs_to :imageable, polymorphic: true
    
    #carousel validate title + descrption
    # expires after today
    
    
  
    
    private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
