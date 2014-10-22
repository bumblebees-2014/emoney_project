class User < ActiveRecord::Base

  has_many :interests
  has_many :crushes

  validates :name, :presence => true
  validates_uniqueness_of :email

  has_secure_password
end
