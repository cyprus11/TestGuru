class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :test, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
