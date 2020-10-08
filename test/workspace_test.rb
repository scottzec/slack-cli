require_relative "test_helper"

describe Workspace do
  describe "constructor" do
    it "instantiates correctly" do
      VCR.use_cassette("workspace") do
        workspace = Workspace.new

        expect(workspace.users).must_be_instance_of Array
        expect(workspace.users[0]).must_be_instance_of User

        expect(workspace.channels).must_be_instance_of Array
        expect(workspace.channels[0]).must_be_instance_of Channel
      end
    end
  end

  describe "select_channel method" do

    before do
      VCR.use_cassette("workspace") do
        @workspace = Workspace.new
        @channel_name = "general"
        @slack_id = "C0165N9BX3M"
        @member_count = 106
      end
    end

    it "name returns instance of channel" do

      VCR.use_cassette("workspace") do
        property = "name"
        selection = @workspace.select_channel(@channel_name, property)

        expect(selection).must_be_instance_of Channel
        expect(selection.slack_id).must_equal @slack_id
        expect(selection.member_count).must_equal @member_count
        expect(selection.channel_name).must_equal @channel_name
      end
    end


    it "id returns instance of channel" do
      VCR.use_cassette("workspace") do
        property = "id"
        selection = @workspace.select_channel(@slack_id, property)

        expect(selection).must_be_instance_of Channel
        expect(selection.slack_id).must_equal @slack_id
        expect(selection.member_count).must_equal @member_count
        expect(selection.channel_name).must_equal @channel_name
      end
    end
  end

  describe "select user method" do

    before do
      VCR.use_cassette("workspace") do
        @workspace = Workspace.new
        @username = "slackbot"
        @slack_id = "USLACKBOT"
        @real_name = "Slackbot"
      end
    end

    it "name returns instance of user" do

      VCR.use_cassette("workspace") do
        property = "name"
        selection = @workspace.select_user(@username, property)

        expect(selection).must_be_instance_of User
        expect(selection.slack_id).must_equal @slack_id
        expect(selection.real_name).must_equal @real_name
      end
    end


    it "id returns instance of user" do
      VCR.use_cassette("workspace") do
        property = "id"
        selection = @workspace.select_user(@slack_id, property)

        expect(selection).must_be_instance_of User
        expect(selection.slack_id).must_equal @slack_id
        expect(selection.real_name).must_equal @real_name
      end
    end
  end

end

