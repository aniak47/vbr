class Show < ActiveRecord::Base
    has_and_belongs_to_many :staffs
    has_many :blogposts, as: :blogable, dependent: :destroy
    has_many :images, as: :imageable, dependent: :destroy
    has_many :podcasts
    accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:picture].blank? }, :allow_destroy => true
    
    validates :name, presence: true
    validates :description, presence: true
    validates :catergory, inclusion: { in: %w(specialty podcast)}, allow_blank: true
    validates :end, presence: true, if: :specialty?
    validates :start, presence: true, if: :specialty?
    
    scope :specialty, -> { where(catergory: 'specialty') } 
    scope :podcast, -> { where(catergory: 'podcast') } 

    def specialty?
        catergory == "specialty"
    end
    
end
