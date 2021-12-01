class AddIndexToUsersTest < ActiveRecord::Migration[6.1]
  def change
    add_index :users_tests, [:user_id, :test_id], unique: true
  end
end
