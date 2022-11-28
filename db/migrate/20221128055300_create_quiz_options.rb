class CreateQuizOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_options do |t|
      t.string :content
      t.string :correct_answer
      t.references :quiz_question, null: false, foreign_key: true
      t.timestamps
    end
  end
end
