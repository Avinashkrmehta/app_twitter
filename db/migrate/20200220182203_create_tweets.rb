class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :contents
      t.integer :user_id

      t.timestamps
    end
    add_index :tweets, [:user_id, :created_at]
  end
end
