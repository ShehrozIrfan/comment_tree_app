RSpec.describe Comment, type: :model do

  describe "associations" do
    it "comment belongs to a parent" do
      expect(described_class.reflect_on_association(:parent).macro).to eq(:belongs_to)
    end

    it "comment has many responses" do
      expect(described_class.reflect_on_association(:responses).macro).to eq(:has_many)
    end

    it "comment belongs to a user" do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end

  describe "validations for comments model" do
    before(:example) do
      @comment = Comment.new(text: "This is some testing comment")
    end

    it "comment should be an instance of Comment class" do
      expect(@comment).to be_instance_of Comment
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
