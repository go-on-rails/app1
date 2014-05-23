class AddResultToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :result, :integer
  end
end
