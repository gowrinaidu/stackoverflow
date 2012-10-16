class AddQidToSubjects < ActiveRecord::Migration
  def change
       add_column :subjectmodules, :question_id, :integer
  end
end

