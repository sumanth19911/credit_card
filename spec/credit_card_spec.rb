require "spec_helper"


describe CreditCard do
	let(:cc) { CreditCard.new name: "Tom", number: 4111111111111111 , credit_limit: 1000 }
	describe "initialization" do
	    it "is initialized with a hash" do
	      expect(cc.name).to eq("Tom")
	      expect(cc.number).to eq(4111111111111111)
	    end
	end

	describe "Charge" do
		context "When balance is with in limit" do
		 it "increases the balance" do
		 	cc.charge(100)
		 	cc.charge(200)
		 	expect(cc.balance).to eq(300)
		 end 
		end

		context "When balnaces goes over the limit" do 
			it "ignores the charge" do
				cc.charge 500
				cc.charge 800 
				expect(cc.balance).to eq(500)
			end
		end 

		context "when credit card number is invalid" do 
			it "ignores the charges" do
				cc1 = CreditCard.new name: "Quincy", number: 1234567890123456, credit_limit: 500
				cc1.charge 100
				expect(cc1.balance).to eq(0)			
			end
		end

		describe "credit" do
			let(:cc2) { CreditCard.new name: "lisa", number: 5454545454545454  , credit_limit: 3000 }
			context "When balnaces are above $0" do
			 it "decrease the balance" do
			 	cc2.charge(200)
			 	cc2.credit(100)
			 	expect(cc2.balance).to eq(100)
			 end 
			end

			context "When balnaces are below $0" do 
				it "the balance becomes negative" do
					cc2.charge 7
					cc2.credit 100
					expect(cc2.balance).to eq(-93)
				end
			end 

			context "when credit card number is invalid" do 
				it "ignores the charges" do
					cc1 = CreditCard.new name: "Quincy", number: 1234567890123456, credit_limit: 500
					cc1.charge 100
					expect(cc1.balance).to eq(0)			
				end
			end
		end

	end
end