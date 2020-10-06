require_relative "test_helper"

require 'simplecov'
SimpleCov.start

describe User do
  describe "constructor" do

    before do
      slack_id = 4
      name = "name"
      @username = "SlackBot"
      @real_name = "Slack Bot"
      @user = User.new(slack_id: slack_id, username: @username, real_name: @real_name, name: name)
    end

    it "creates a User object" do
      expect(@user).must_be_instance_of User
    end

    it "returns a user name" do
      expect(@user.username).must_equal @username
    end

    it "returns a real name" do
      expect(@user.real_name).must_equal @real_name
    end

  end
end