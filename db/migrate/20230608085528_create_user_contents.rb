class CreateUserContents < ActiveRecord::Migration[6.1]
  def change
    create_table :user_contents do |t|
      t.integer :user_id
      t.integer :content_id
      
      t.timestamps
    end
  end
end
