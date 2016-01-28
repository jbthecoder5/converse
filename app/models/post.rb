class Post < ActiveRecord::Base
	belongs_to :user, class_name: 'User'
	has_many :comments, class_name: 'Comment'

	validates_presence_of :body
	validates :title, presence: true, uniqueness: true
	validates_length_of :title, maximum: 25, message: "Title cannot be longer than 25 letters"

end
