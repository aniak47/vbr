class Staff < ActiveRecord::Base
  
  attr_accessor :activation_token, :reset_token, :remember_token
  before_save   :downcase_email
  before_create :create_activation_digest
  
  has_and_belongs_to_many :shows
  has_many :blogposts, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :podcasts
  has_many :top_tens
  
  
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, if: :act?
  validates :name,  presence: true, length: { maximum: 50 }, if: :act?
  
  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  # Returns a random token.
  def Staff.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns the hash digest of the given string.
  def Staff.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token =Staff.new_token
    update_attribute(:remember_digest, Staff.digest(remember_token))
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
    
  def act?
      activated
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Staff.new_token
    update_attribute(:reset_digest,  Staff.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    StaffMailer.password_reset(self).deliver_now
  end
  
  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  # Sends activation email.
  def send_activation_email
    StaffMailer.account_activation(self).deliver_now
  end
    
    private
    
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
    
    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Staff.new_token
      self.activation_digest = Staff.digest(activation_token)
    end
end