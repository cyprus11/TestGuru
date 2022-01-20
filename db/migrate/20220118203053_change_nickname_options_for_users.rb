class ChangeNicknameOptionsForUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :nickname, :string, null: true
  end
end
