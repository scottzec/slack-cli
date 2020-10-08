require_relative 'recipient'
require 'dotenv'

Dotenv.load

class User < Recipient
  attr_reader :username, :real_name, :slack_id

  USER_LIST_URL = "https://slack.com/api/users.list"

  def initialize(slack_id:, username:, real_name:)
    super(slack_id)

    @username = username
    @real_name = real_name
  end

  def self.list_all
    query = {
        token: ENV["SLACK_TOKEN"]
    }
    response = self.get(USER_LIST_URL, query)

    responses = response["members"].map do |member|
      self.new(slack_id: member["id"], username: member["name"],
               real_name: member["real_name"],
               )
    end
    return responses
  end
end
