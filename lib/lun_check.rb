class LunCheck
	attr_accessor :number

	def initialize(number)
		@number = number	
	end

	def valid? 
		if (sum_odd + sum_even)%10 == 0 && number.length <= 19
			return true
		else
			return false
		end
	end
    
    private
		def sum_odd
			s1 = 0
		    @number = @number.to_s
			@number.split('').reverse.each_with_index do |d,i|
			 	d = d.to_i 
			 	i = i+1
			 	if i.odd? 
			 		s1 += d
			 	end
			 end
			 s1
		end

    private
		def sum_even
			sum = 0
			s2 = 0 
		    @number = @number.to_s
			@number.split('').reverse.each_with_index do |d,i|
			 	d = d.to_i 
			 	i = i+1
			 	if i.even? 
			 		two_times = d * 2
			 		s2 += two_times.to_s.chars.map(&:to_i).reduce(:+)
			 	end
			end
			s2
		end
    
	

end
