RSpec.describe Comment, type: :model do
  describe "validations for comments model" do
    before(:example) do
      @comment = Comment.new(text: "This is some testing comment")
    end

    it "when text is present and its valid" do
      expect(@comment).to be_valid
    end

    it "when text is not present" do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it "when text is less than 10 characters" do
      @comment.text = "a" * 9
      expect(@comment).to_not be_valid
    end

    it "when text is greater than 500 characters" do
      @comment.text = "a" * 501
      expect(@comment).to_not be_valid
    end
  end
end
