class AddRawTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :raw_text, :text
  end
end
