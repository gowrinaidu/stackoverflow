class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :answer_id

      t.timestamps
    end
  end
end
