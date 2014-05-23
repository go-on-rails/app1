class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :numbers

      t.timestamps
    end
  end
end
