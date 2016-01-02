class Post < ActiveRecord::Base
	belongs_to :user, class_name: 'User'
	has_many :comments, class_name: 'Comment'

	validates_presence_of :body
	validates :title, presence: true, uniqueness: true
	
end
