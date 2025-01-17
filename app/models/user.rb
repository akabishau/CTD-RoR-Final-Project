class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books
end
