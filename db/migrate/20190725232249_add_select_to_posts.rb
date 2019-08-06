class AddSelectToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :select, :string
  end
end
