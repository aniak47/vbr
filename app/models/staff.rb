class Staff < ActiveRecord::Base
  has_and_belongs_to_many :shows
  has_many :blogposts, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :podcasts
  has_many :top_tens
  
  
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end