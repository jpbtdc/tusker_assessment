class CreateBoxContents < ActiveRecord::Migration[5.0]
  def change
    create_table :box_contents do |t|
      t.string :code
    end
  end
end
