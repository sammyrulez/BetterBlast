class CreateAaSequences < ActiveRecord::Migration
  def self.up
    create_table :aa_sequences do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :aa_sequences
  end
end
