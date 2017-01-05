class AlterBoxesAddIndexCode < ActiveRecord::Migration[5.0]
  def change
    add_index :boxes, :code, unique: true
  end
end
