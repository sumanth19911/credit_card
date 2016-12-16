require_relative "../lib/credit_card"
require_relative "../lib/lun_check"
require 'readline'

@accounts = []

def check(number)
	if LunCheck.new(number).valid? == true 
		valid = true
	else 
		valid = false 
	end
end

def transaction(input)
        input = input ||= "exit"
		input = input.split  
		command = input[0] ||= "exit" 
		switch = command.downcase 
		name = input[1]
		number = input[2].to_i
     
	    case switch
	    when  "add"
	        valid = check(number)
	    	credit_limit = input[3].split('$')[1].to_i
	    	cc = CreditCard.new(name: name.downcase, number: number , credit_limit: credit_limit , valid:valid)
			@accounts << cc

		when "charge"
			amount = input[2].split('$')[1].to_i
			cc = @accounts.find { |account| account.name == name.downcase }
			if cc.valid == true 
			   cc.charge(amount)
			else
				cc.balance = "error"
			end

		when 'credit'
			dollars = input[2].split('$')[1].to_i
			cc = @accounts.find { |account| account.name == name.downcase }
			if cc.valid == true 
			   cc.credit(dollars)
			else
				cc.balance = "error"
			end
		else
			puts "please enter the correct command or press ctrl+c to exit"	
		end
		@accounts.sort_by!{|account| account.name}
end 

def out_file()
	  @accounts.map { |account| 
		if account.valid == true 
		   s = account.name + " "+"$" + account.balance.to_s
		   File.open('summary', 'a+') { |file| file.puts(s) }
		else 
			s = account.name+" "+account.balance.to_s
			File.open('summary', 'a+') { |file| file.puts(s) }
		end }	     
end


def mannual()
	begin 
		while input = Readline.readline("> ", true)
			transaction(input)
		end	
	rescue Interrupt
		out_file
		exit
	end

end

def automated (file_path)
	f = File.open(file_path, 'r')
	f.each do |line|
		transaction(line)
	end
end


if ARGV.empty? 
	mannual
	out_file
else
	automated(ARGV[0])
	out_file
end
 












