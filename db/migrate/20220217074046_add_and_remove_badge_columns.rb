class AddAndRemoveBadgeColumns < ActiveRecord::Migration[6.1]
  def up
    remove_column :badges, :from_the_first_time
    remove_column :badges, :all_category
    remove_column :badges, :all_levels
    add_column :badges, :role_name, :string
    add_column :badges, :role_value, :string

    add_foreign_key :user_badges, :users
    add_foreign_key :user_badges, :badges
  end

  def down
    add_column :badges, :from_the_first_time, :boolean, default: false
    add_column :badges, :all_category, :boolean, default: false
    add_column :badges, :all_levels, :boolean, default: false
    remove_column :badges, :role_name
    remove_column :badges, :role_value

    remove_foreign_key :user_badges, :users
    remove_foreign_key :user_badges, :badges
  end
end
