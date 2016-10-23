class User < ApplicationRecord
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME = /\A[a-zA-Z]+\z/
  validates :f_name, presence:true, length: { minimum:4  }, format: { with: NAME }  
  validates :l_name, presence:true, length: { minimum:4  }, format: { with: NAME }
  validates :email, presence:true, length: { minimum:30 }, format: { with: REGEX }, uniqueness:true
  validates :reg, presence:true, length: 13, uniqueness:true
  validates :phone, presence:true, length:10, numeric:true, uniqueness:true
end
