class AlterBoxContentsAddIndexBoxIdCode < ActiveRecord::Migration[5.0]
  def change
    add_index :box_contents, [:box_id, :code], unique: true
  end
end
