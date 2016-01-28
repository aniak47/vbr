class Show < ActiveRecord::Base
    has_and_belongs_to_many :staffs
    has_many :blogposts, as: :blogable, dependent: :destroy
    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:picture].blank? }, :allow_destroy => true
    
    validates :name, presence: true
    validates :description, presence: true
    validates :catergory, inclusion: { in: %w(specialty podcast)}, allow_blank: true
end
