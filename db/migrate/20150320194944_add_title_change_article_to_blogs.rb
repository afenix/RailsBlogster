class AddTitleChangeArticleToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :title, :string
  	rename_column :blogs, :article, :body
  end
end
