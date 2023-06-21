class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :info
      t.integer :feedback_on_id
      t.string :feedback_on_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
