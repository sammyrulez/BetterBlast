require 'bio'

class Ricombinator

	
	def findKeys(valueX, codonTableIndex)
			
			keys = []
			t =Bio::CodonTable[codonTableIndex].table
			t.each {|key, value| 
				if value == valueX
					keys.push key
				end
			 }
			
			return keys
	end
	
	
	def computeStringsDeep(s,codonTableIndex, results,  prefix)
			
        toCompute = s[0,1] 
             
        keys = findKeys(toCompute,codonTableIndex)
        
        keys.each {|combs|
                if s.length > 1
                    computeStringsDeep(s[1..s.length],codonTableIndex,results,prefix + combs)
                else
                    results.push Bio::Sequence::NA.new(prefix + combs)
                end

        }




    end


    def computeStrings(s, codonTableIndex)

       
        results = []
        toCompute = s[0,1] 
       
        keys = findKeys(toCompute,codonTableIndex)
       
         keys.each {|combs|                 
                    computeStringsDeep(s[1..s.length],codonTableIndex,results,combs)
        }

       return results
     end
    
end