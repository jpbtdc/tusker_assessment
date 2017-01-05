class AlterBoxContentsAddBox < ActiveRecord::Migration[5.0]
  def change
    add_reference :box_contents, :box, foreign_key: true
  end
end
