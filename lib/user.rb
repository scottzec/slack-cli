require_relative 'recipient'
require 'dotenv'

Dotenv.load


class User < Recipient
  attr_reader :username, :real_name

  USER_LIST_URL = "https://slack.com/api/users.list"

  def initialize(slack_id:, username:, real_name:, name:)
    super(slack_id, name)

    @username = username
    @real_name = real_name
  end

  def self.list_all
    self.get(USER_LIST_URL, query)
  end

end