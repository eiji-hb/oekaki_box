class AddImageUriDataToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :dataURI, :text
  end
end
