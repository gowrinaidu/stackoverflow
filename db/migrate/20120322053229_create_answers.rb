class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :user_name
      t.text :user_answer

      t.timestamps
    end
  end
end
