class CreateReportHits < ActiveRecord::Migration
  def self.up
    create_table :report_hits do |t|
      t.decimal :bit_score
      t.decimal :evalue
      t.integer :identity
      t.integer :overlap
      t.integer :len
      t.text :target
      t.integer :na_sequence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :report_hits
  end
end
