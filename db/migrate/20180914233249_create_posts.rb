class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.text :tags
      t.text :status
      t.text :excerpt
      t.jsonb :metadata
      t.integer :user_id
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
