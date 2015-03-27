class Post < ActiveRecord::Base
	
  has_many :comments

  validates :title, :author, :body, :presence => true
end