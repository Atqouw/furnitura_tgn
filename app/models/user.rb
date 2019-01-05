class User < ApplicationRecord
  enum role: { admin: 0, member: 1 }

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  # validates :first_name, presence: true
end
