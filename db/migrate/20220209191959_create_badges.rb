class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :image, default: 'default_badge'
      t.boolean :from_the_first_time, default: false
      t.boolean :all_category, defult: false
      t.boolean :all_levels, default: false
      t.references :user, foreign_key: true, null: true

      t.timestamps
    end
  end
end
