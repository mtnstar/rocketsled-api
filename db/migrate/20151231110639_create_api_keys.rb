class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :user_id, null: false
      t.string :access_token, null: false

      t.timestamps null: false
    end
  end
end
