class Event < ActiveRecord::Base
    validates :title, presence: true
    validates :blurb, presence: true
    validates :date, presence: true
    validates :catergory, inclusion: { in: %w(promo other)}
end
