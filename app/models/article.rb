class Article < ActiveRecord::Base
    mount_uploader :video, VideoUploader
    belongs_to :staff
    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:picture].blank? }, :allow_destroy => true
    
    validates :title, presence: true
    validates :content, presence: true
    validates :staff_id, presence: true
    validates :catergory, inclusion: { in: %w(news sports station promo)}
    
    scope :news, -> { where(catergory: 'news') } 
    scope :sports, -> { where(catergory: 'sports') } 
    scope :promo, -> { where(catergory: 'promo') } 
    scope :station, -> { where(catergory: 'station') } 
    
end
