class CreateCards < ActiveRecord::Migration
  def change
  	 create_table :cards do |t|
  		t.text :term, null: false
  		t.text :definition, null: false
  		t.references :deck

  		t.timestamps
  	end
  end
end
