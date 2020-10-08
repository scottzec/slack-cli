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

  describe "list_all" do
    before do
      VCR.use_cassette("slack_channels") do
        channel_list_url = "https://slack.com/api/conversations.list"
        @query = {
            token: ENV["SLACK_TOKEN"]
        }
        @response = Channel.get(channel_list_url, @query)
      end
    end

    it "checks list_all returns an array of Chanel instances" do
      VCR.use_cassette("slack_channel") do
        channels = Channel.list_all

        expect(channels[0]).must_be_instance_of Channel
        expect(channels).must_be_instance_of Array
      end
    end


    it "checks successful get method response" do
      expect(@response["ok"]).must_equal true
    end

    it "raises ArgumentError if failed API call" do
      VCR.use_cassette("slack_channel") do
        bad_channel_list_url = "https://slack.com/api/conversations.list5"
        expect{Channel.get(bad_channel_list_url, @query)}.must_raise ArgumentError
      end
    end

    it "checks no error key returned in response" do
      expect(@response["error"]).must_be_nil
    end
  end
end