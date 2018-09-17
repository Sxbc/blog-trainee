class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.datetime :subscription_at
      t.string :status

      t.timestamps null: false
    end
  end
end
