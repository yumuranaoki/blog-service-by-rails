class User < ApplicationRecord
  has_secure_password
  validates(:name, presence: true)
  validates(:email, presence: true)
  validates(:email, uniqueness: true)

  has_many :posts, dependent: :destroy
end
