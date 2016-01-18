class Article < ActiveRecord::Base
    belongs_to :staff
    
    validates :title, presence: true
    validates :content, presence: true
    validates :staff_id, presence: true
    validates :type, inclusion: { in: %w(news sports station)}
    
end
