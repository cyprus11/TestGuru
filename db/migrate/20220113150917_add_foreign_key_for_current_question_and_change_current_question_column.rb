class AddForeignKeyForCurrentQuestionAndChangeCurrentQuestionColumn < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :test_passages, :questions, column: :current_question_id
    change_column :test_passages, :current_question_id, :integer, null: true
  end
end
