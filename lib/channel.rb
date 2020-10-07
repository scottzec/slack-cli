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

    # TODO: check for errors

    responses = response["channels"].map do |channel|
      self.new(slack_id: channel["id"], name: channel["name"],
        channel_name: channel["name"], topic: channel["topic"],
        member_count: channel["num_members"])
    end
    return responses
  end
end