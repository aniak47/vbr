class Shift < ActiveRecord::Base
    has_and_belongs_to_many :staffs
    
    validates :title, presence: true
    validates :day, presence: true
    validates :start, presence: true
    validates :end, presence: true
   # validates :blurb, length: { maximum: 200 }
end
