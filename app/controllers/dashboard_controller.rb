class DashboardController < ApplicationController

		 before_filter :authenticate_user!
		
		def index
			@aa_sequences = AaSequence.all
		end

end
