class AddSubjectToQuestions < ActiveRecord::Migration
  def change
        add_column :questions, :subjects, :string
  end
end

