class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title
      t.integer :level

      t.timestamps
    end
  end
end