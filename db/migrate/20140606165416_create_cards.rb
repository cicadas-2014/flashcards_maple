class CreateCards < ActiveRecord::Migration
  def change
  	 create_table :cards do |t|
  		t.string :term, null: false
  		t.string :definition, null: false
  		t.references :deck
  		
  		t.timestamps
  	end
  end
end
