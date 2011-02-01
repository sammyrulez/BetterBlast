class AddDescrDbToAaSeq < ActiveRecord::Migration
  def self.up
  	add_column :aa_sequences, :description, :text
  	add_column :aa_sequences, :ref_table, :string
  	
  end

  def self.down
  	remove_column :aa_sequences, :description, :text
  	remove_column :aa_sequences, :ref_table, :string
  
  end
end
