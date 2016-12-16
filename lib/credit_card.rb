class CreditCard
	attr_accessor :name, :number, :limit , :balance, :valid
	
	def initialize(card = {})
		@name = card[:name]
		@number = card[:number]
		@limit = card[:credit_limit] || 0 
		@balance = 0
		@valid = card[:valid]
	end

	def charge(dollars)
		if @balance+dollars > @limit

		else
			@balance = @balance+dollars
		end 
	end 

	def credit(dollars)
		@balance = @balance - dollars
	end
end

