class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.string :round_id
  		t.string :card_id
  		t.integer :attempts, default: 0
  		t.boolean :correct_guess

  		t.timestamps 
  	end  	
  end
end
