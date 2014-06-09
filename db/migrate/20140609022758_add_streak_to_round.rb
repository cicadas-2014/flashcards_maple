class AddStreakToRound < ActiveRecord::Migration
  def change
  	add_column :rounds, :streak, :integer, default: 0
  end
end
