class AddHistoryIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :history_id, :integer
  end
end
