class User < ActiveRecord::Base
  has_many :posts
  has_many :attachments, through: :posts
  has_many :pages
  has_many :attachments, through: :pages
  has_many :roles
  # has_many :attachments
  has_many :user_metum
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
