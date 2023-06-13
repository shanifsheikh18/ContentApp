class AddAttachedContentsToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :attached_contents, :integer, array: true, default: []
  end
end
