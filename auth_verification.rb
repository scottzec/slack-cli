require 'dotenv'
require 'httparty'

Dotenv.load

query = {
    token: ENV["SLACK_TOKEN"]
}

response = HTTParty.get("https://www.slack.com/api/conversations.list", query: query)

response.each do |response|

end