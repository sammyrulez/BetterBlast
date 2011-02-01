class NaSequence < ActiveRecord::Base

	belongs_to :aa_sequence
	has_many :report_hit

end
