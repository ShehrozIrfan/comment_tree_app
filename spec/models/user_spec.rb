RSpec.describe User, type: :model do

  describe "associations" do
    it "user has many comments" do
      expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many)
    end
  end

  describe "validations for users model" do
    before(:example) do
      @user = User.new(email: "shehrozirfan899@gmail.com", first_name: "Shehroz", last_name: "Irfan", password: "Foobar@123", password_confirmation: "Foobar@123")
    end

    it "user should be an instance of User class" do
      expect(@user).to be_instance_of User
    end

    context "when user is invalid" do
      it "when email is nil" do
        @user.email = nil
        expect(@user).to_not be_valid
      end

      it "when email is invalid" do
        @user.email = "sheh89.com"
        expect(@user).to_not be_valid
      end

      it "when email already exists" do
        User.create(email: "hello@test.com", password: "Foobar@123", password: "Foobar@123")
        @user.email = "hello@test.com"
        expect(@user).to be_invalid
      end

      it "when first name is blank" do
        @user.first_name = nil
        expect(@user).to be_invalid
      end

      it "when last name is blank" do
        @user.last_name = nil
        expect(@user).to be_invalid
      end

      it "when first name is less than 3 characters" do
        @user.first_name = "aa"
        expect(@user).to be_invalid
      end

      it "when last name is less than 3 characters" do
        @user.last_name = "aa"
        expect(@user).to be_invalid
      end

      it "when first name is greater than 12 characters" do
        @user.first_name = "a" * 13
        expect(@user).to be_invalid
      end

      it "when last name is greater than 12 characters" do
        @user.last_name = "a" * 13
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
    end

    context "when user is valid" do
      it "when email is valid" do
        expect(@user).to be_valid
      end

      it "when password and password confirmation matches" do
        expect(@user).to be_valid
      end
    end
  end
end
