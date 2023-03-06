class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: false
      t.integer :question_id, null: false

      t.timestamps
    end

    add_foreign_key :answers, :questions
  end
end
