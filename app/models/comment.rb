class Comment < ActiveRecord::Base
   validates :body, :post_id, :presence => true
end
