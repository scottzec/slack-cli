require_relative 'recipient'

class User < Recipient
  attr_reader :username, :real_name

  def initialize(slack_id:, username:, real_name:, name:)
    super(slack_id, name)

    @username = username
    @real_name = real_name
  end
end