require "spec_helper"

describe LunCheck do 
		let(:lun) { LunCheck.new 61789372994}
		let(:lun1) { LunCheck.new 1234567890123456}
		describe "sum_odd" do 
			it "Returns the sum of digits at odd index" do
			expect(lun.send(:sum_odd)).to eq(42)
			end 
		end 

		describe "sum_even" do
			it "it returns the sum of the product of double of the digit at even index" do 
				expect(lun.send(:sum_even)).to eq(28)
			end 
		end

		describe "valid?" do 
			context "when the number is valid" do
				it "Returns true" do
					expect(lun.valid?).to be true
				end
			end

			context "when the isn NOT valid" do 
				it "returns FALSE" do
					expect(lun1.valid?).to be false
				end 
			end 
		end 


end 
