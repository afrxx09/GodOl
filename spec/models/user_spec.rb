require 'spec_helper'

describe User do
	
	before do
		@user = User.new(
			name: "Test Exempel",
			email: "test@exempel.com",
			password: 'testpassword',
			password_confirmation: 'testpassword'
		)
	end
	
	subject { @user }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	
	it { should be_valid }
	
	describe "When name is empty" do
		before { @user.name = "" }
		it { should_not be_valid }
	end
	
	describe "When email is empty" do
		before { @user.email = ""}
		it { should_not be_valid }
	end
	
	describe "When password is missing" do
		before do
			@user.password = " "
			@user.password_confirmation = " "
		end
		
		it { should_not be_valid }
	end
	
	describe "When password is not matching confirmation" do
		before do
			@user.password = "real_password"
			@user.password_confirmation = "missmatch"
		end
		
		it { should_not be_valid }
	end
	
	describe "When password is too short" do
		before { @user.password = "aaaaa" }
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
	
	describe "Email address is mixed lower and upper case" do
		let(:mix_case_email) {"tEsT@ExAmPlE.com"}
		it "should be saved with lower case" do
			@user.email = mix_case_email
			@user.save
			expect(@user.reload.email).to eq = mix_case_email.downcase
		end
	end
	
end