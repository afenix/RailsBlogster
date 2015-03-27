class AddColumnToComments < ActiveRecord::Migration
  def change
      add_column :comments, :author, :string
  end
end
