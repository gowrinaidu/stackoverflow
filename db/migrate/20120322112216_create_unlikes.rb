class CreateUnlikes < ActiveRecord::Migration
  def change
    create_table :unlikes do |t|
      t.integer :answer_id

      t.timestamps
    end
  end
end
