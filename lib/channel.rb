require_relative 'recipient'

class Channel < Recipient
  attr_reader :slack_id, :channel_name, :topic, :member_count

  CHANNEL_LIST_URL = "https://slack.com/api/conversations.list"

  def initialize(slack_id:, name:, channel_name:, topic:, member_count:)
    super(slack_id, name)

      @channel_name = channel_name
      @topic = topic
      @member_count = member_count
    end

  def self.list_all
    query = {
        token: ENV["SLACK_TOKEN"]
    }
    response = self.get(CHANNEL_LIST_URL, query)
    return response
  end
end