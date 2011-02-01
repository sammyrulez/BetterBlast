class CreateNaSequences < ActiveRecord::Migration
  def self.up
    create_table :na_sequences do |t|
      t.text :content
      t.integer :computed
      t.integer :aa_sequence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :na_sequences
  end
end
