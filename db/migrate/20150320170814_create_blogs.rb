class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.column :article, :string
    	t.column :author, :string

    	t.timestamps
    end
  end
end
