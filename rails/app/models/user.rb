# Record for an authorized user.
#
# If it's at all possible, we should try to avoid tacking methods onto this
# class; there are better ways to structure things than creating overlord records
class User < ApplicationRecord
  has_many :user_dives
  has_many :dives, through: :user_dives
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
