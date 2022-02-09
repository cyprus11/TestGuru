class AddDisplayToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :display, :boolean, default: false
  end
end
