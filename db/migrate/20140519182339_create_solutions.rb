class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :selected_numbers
      t.integer :max
      t.integer :min
      t.integer :task_id
      t.timestamps
    end
  end
end
