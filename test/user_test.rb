require_relative "test_helper"

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

  describe "list_all" do
    it "checks list_all returns an array of user instances" do
      VCR.use_cassette("slack_user") do
        users = User.list_all

        expect(users[0]).must_be_instance_of User
        expect(users).must_be_instance_of Array
      end
    end


    it "checks successful get method response" do
      VCR.use_cassette("slack_user") do
        user_list_url = "https://slack.com/api/users.list"
        query = {
            token: ENV["SLACK_TOKEN"]
        }
        response = User.get(user_list_url, query)

        expect(response["ok"]).must_equal true
      end
    end

    it "raises ArgumentError if failed API call" do
      VCR.use_cassette("slack_user") do
        user_list_url = "https://slack.com/api/users.list5"
        query = {
            token: ENV["SLACK_TOKEN"]
        }
        expect{User.get(user_list_url, query)}.must_raise ArgumentError
      end
    end

    it "checks no error key returned in response" do
      VCR.use_cassette("slack_user") do
        user_list_url = "https://slack.com/api/users.list"
        query = {
            token: ENV["SLACK_TOKEN"]
        }
        response = User.get(user_list_url, query)

        expect(response["error"]).must_be_nil
      end
    end
  end
end