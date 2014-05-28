class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.text :body
      t.boolean :is_featured, default: false
      t.references :category, index: true
      t.datetime :expired_at
      t.boolean :is_vacancy, default: false

      t.timestamps
    end
  end
end
