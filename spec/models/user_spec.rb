require 'spec_helper'

describe User do
	
	before { @user = User.new(name: "Test Exempel", email: "test@exempel.com") }
	
	subject { @user }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should be_valid }
	
	describe "When name is empty" do
		before { @user.name = "" }
		it { should_not be_valid }
	end
	
	describe "When email is emnpty" do
		before { @user.email = ""}
		it { should_not be_valid }
	end
	
	describe "When email has incorrect format" do
		it "should be invalid" do
			addresses = %w[user@asd,com user_at_asd.com user@asd@test.com user@asd+.com]
			
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end
	
	describe "When email has correct format" do
		it "should be valid" do
			addresses = %w[user@asd.com user@ASD.com user.user@test.se user_asd@asd.qwe.se]
			
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end
	
	describe "When email is not unique" do
		before do
			@user_copy = @user.dup
			@user_copy.email = @user.email.upcase
			@user_copy.save
		end
		
		it { should_not be_valid }
	end
	
end