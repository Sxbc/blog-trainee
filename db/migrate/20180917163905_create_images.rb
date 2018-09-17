class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :post_id
      t.string :caption
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
