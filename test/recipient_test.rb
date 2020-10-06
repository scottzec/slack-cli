require_relative "test_helper"

require 'simplecov'
SimpleCov.start

describe Recipient do

  describe "constructor" do

    before do
      @slack_id = 4
      @name = "#random"
      @recipient = Recipient.new(@slack_id, @name)
    end

    it "creates a Recipient object" do
      expect(@recipient).must_be_instance_of Recipient
    end

    it "returns a slack id" do
      expect(@recipient.slack_id).must_equal @slack_id
    end

    it "returns a name" do
      expect(@recipient.name).must_equal @name
    end
  end

end