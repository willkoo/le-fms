class AddColumnsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :video_url, :string
    add_column :quizzes, :video_completed, :boolean, default: false
  end
end
