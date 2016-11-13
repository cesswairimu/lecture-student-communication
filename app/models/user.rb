class User < ApplicationRecord
  attr_accessor :remember_token
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME = /\A[a-zA-Z]+\z/
  validates :f_name, presence:true, length: { minimum:4  }, format: { with: NAME }  
  validates :l_name, presence:true, length: { minimum:4  }, format: { with: NAME }
  validates :email, presence:true, length: { maximum:30 }, format: { with: REGEX }, uniqueness:true
  validates :reg, presence:true, length: { maximum:14 }, uniqueness:true
  validates :phone, presence:true, length: { maximum: 13}, numericality:true, uniqueness:true
  validates :password, length: { minimum: 6 }, allow_blank: true
  has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)

  end
  def User.token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token =User.token
    update_attribute(:remember_digest, User.digest(remember__token))
  end
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
