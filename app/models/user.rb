class User < ApplicationRecord
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME = /\A[a-zA-Z]+\z/
  validates :f_name, presence:true, length: { minimum:4  }, format: { with: NAME }  
  validates :l_name, presence:true, length: { minimum:4  }, format: { with: NAME }
  validates :email, presence:true, length: { minimum:30 }, format: { with: REGEX }
  validates :reg, presence:true, length: 13
  validates :phone, presence:true, length:10, numeric:true
end
