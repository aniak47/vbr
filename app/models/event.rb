class Event < ActiveRecord::Base
    
    validates :name, presence: true, length: { maximum: 100 }
    validates :blurb, presence: true
    validates :date, presence: true
    validates :catergory, inclusion: { in: %w(Promo Other)}, allow_blank: true
    
    default_scope -> { order(:date) }
    scope :future, ->  { where('date > ?', Date.today) }
end
