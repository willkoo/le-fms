class DeleteQuizs < ActiveRecord::Migration[7.0]
  def change
    drop_table :quizs
  end
end
