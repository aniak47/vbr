class Event < ActiveRecord::Base
    default_scope -> { order(:date) }
    default_scope { where('date > ?', Date.today) }
    validates :name, presence: true, length: { maximum: 50 }
    validates :blurb, presence: true
    validates :date, presence: true
    validates :catergory, inclusion: { in: %w(Promo Other)}, allow_blank: true
end
