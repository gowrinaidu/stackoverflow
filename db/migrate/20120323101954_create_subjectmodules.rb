class CreateSubjectmodules < ActiveRecord::Migration
  def change
    create_table :subjectmodules do |t|
      t.string :subject_name
      t.timestamps
    end
  end
end

