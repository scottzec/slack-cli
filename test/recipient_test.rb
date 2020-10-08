require_relative "test_helper"

describe Recipient do

  describe "constructor" do

    before do
      @slack_id = 4
      @recipient = Recipient.new(@slack_id)
    end

    it "creates a Recipient object" do
      expect(@recipient).must_be_instance_of Recipient
    end

    it "returns a slack id" do
      expect(@recipient.slack_id).must_equal @slack_id
    end
  end

end