class Blogpost < ActiveRecord::Base
  belongs_to :staff
  default_scope -> { order(created_at: :desc) }
  validates :staff_id, presence: true
  validates :content, presence: true
end
