require_relative 'recipient'

class User < Recipient
  attr_reader :slack_id, :username, :real_name,

  def initialize(slack_id:, username:, real_name:)
    super(slack_id)

    @username = username
    @real_name = real_name
  end
end