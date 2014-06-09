class AddColumnsToRound < ActiveRecord::Migration
  def change
  	add_column :rounds, :num_correct, :integer
  	add_column :rounds, :num_played, :integer
  	add_column :rounds, :percent_correct, :float
  end
end
