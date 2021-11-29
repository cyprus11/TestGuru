class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :category, null: false, foreign_key: true
      t.text :title, null: false
      t.integer :level, null: false, default: 0

      t.timestamps
    end
  end
end
