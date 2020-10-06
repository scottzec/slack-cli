require_relative 'recipient'

class Channel < Recipient
  attr_reader :slack_id, :channel_name, :topic, :member_count

      def initialize(slack_id:, channel_name:, topic:, member_count:)
        super(slack_id)

        @channel_name = channel_name
        @topic = topic
        @member_count = member_count
      end
end