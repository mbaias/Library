class Category < ActiveRecord::Base
	validates :name, presence: true, length: {minimum:4, maximum:40}
	has_many :books
end
