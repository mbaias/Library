class User < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 2, maximum: 20}
	validates :username, presence: true, length: {minimum: 5, maximum: 20}
	validates :email, presence: true, length: {minimum: 10, maximum: 30}
	has_secure_password
  has_many :favorites
  has_many :books
  has_many :favorite_books, through: :favorites, source: :favorited, source_type: 'Book'
end

