class Item < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    
    validates :name, presence: true, length: { maximum: 100 }
    validates :picture, presence: true
    validates :price, presence: true
    validates :button, presence: true
    
end
