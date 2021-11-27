class MakeUserNicknameAndEmailNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :nickname, false
  end
end
