class Event < ActiveRecord::Base
    
    validates :name, presence: true, length: { maximum: 100 }
    validates :date, presence: true
    validates :time, presence: true
    validates :catergory, inclusion: { in: %w(Promo Concert Other)}, allow_blank: true
    
    default_scope -> { order(:date) }
    scope :concert, -> { where(catergory: 'Concert') } 
    scope :future, ->  { where('date > ?', Date.today) }
    scope :general, -> { where.not(catergory: 'Concert') } 
end
