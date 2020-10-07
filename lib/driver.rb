require_relative 'user'
require "dotenv"
require "httparty"

Dotenv.load

query = {
    token: ENV["SLACK_TOKEN"]
}

response = HTTParty.get("https://slack.com/api/conversations.list", query: query)
puts response
user = User.new(4, "SlackBot", "Slack Bot", "name")
puts user