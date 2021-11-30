class AddAuthorToTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, polymorphic: true
  end
end
