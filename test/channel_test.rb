require_relative "test_helper"

describe Channel do
  describe "constructor" do

    before do
      slack_id = 4
      name = "name"
      @channel_name = "#random"
      @topic = "random stuff"
      @member_count = 12
      @channel = Channel.new(slack_id: slack_id, name: name, channel_name: @channel_name, topic: @topic, member_count: @member_count)
    end

    it "creates a Channel object" do
      expect(@channel).must_be_instance_of Channel
    end

    it "returns a channel name" do
      expect(@channel.channel_name).must_equal @channel_name
    end

    it "returns a topic" do
      expect(@channel.topic).must_equal @topic
    end

    it "returns member count" do
      expect(@channel.member_count).must_equal @member_count
    end

    # Add tests for data type
  end
end