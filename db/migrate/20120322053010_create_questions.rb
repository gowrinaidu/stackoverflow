class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :admin_name
      t.string :question_name

      t.timestamps
    end
  end
end
