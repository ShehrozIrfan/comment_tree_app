RSpec.describe User, type: :model do
  describe "validations for users model" do
    before(:example) do
      @user = User.new(email: "shehrozirfan899@gmail.com", password: "Foobar@123", password_confirmation: "Foobar@123")
    end

    it "user should be an instance of User class" do
      expect(@user).to be_instance_of User
    end

    it "when email is nil" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "when email is invalid" do
      @user.email = "sheh89.com"
      expect(@user).to_not be_valid
    end

    it "when email is valid" do
      expect(@user).to be_valid
    end

    it "when email already exists" do
      User.create(email: "hello@test.com", password: "Foobar@123", password: "Foobar@123")
      @user.email = "hello@test.com"
      expect(@user).to be_invalid
    end

    it "when password is nil" do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it "when password is short" do
      @user.password = "a" * 4
      expect(@user).to be_invalid
    end

    it "when password and password_confirmation doesn't match" do
      @user.password_confirmation = "helloWorld@123"
      expect(@user).to be_invalid
    end

    it "when password and password confirmation matches" do
      expect(@user).to be_valid
    end
  end
end
