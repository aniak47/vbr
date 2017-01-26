class Event < ActiveRecord::Base
    
    validates :name, presence: true, length: { maximum: 100 }
    validates :date, presence: true
    validates :time, presence: true
    validates :catergory, inclusion: { in: %w(Promo Concert Other Unapproved)}
    
    default_scope -> { order(:date, :time) }
    scope :concert, -> { where(catergory: 'Concert') } 
    scope :future, ->  { where('date >= ?', Date.today) }
    scope :general, -> { where('catergory=? OR catergory=?', 'Promo', 'Other')} 
    scope :unapproved, -> { where(catergory: 'Unapproved') } 
end
