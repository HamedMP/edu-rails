class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.integer :order
      t.references :category, index: true

      t.timestamps
    end
    add_index :categories, :slug
  end
end
