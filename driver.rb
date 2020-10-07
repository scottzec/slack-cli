require_relative 'lib/user'
require_relative 'lib/channel'
require_relative 'lib/workspace'
require "dotenv"
require "httparty"
require "table_print"

Dotenv.load

query = {
    token: ENV["SLACK_TOKEN"]
}
USER_LIST_URL = "https://slack.com/api/users.listss"

response = User.get(USER_LIST_URL, query)
puts response
puts response.code
# user = User.new(slack_id: 4, username: "slackbot", real_name: "SlackBot", name: "name")
# tp user

# tp Author.limit(3), "name", "books.title", "books.photos.caption"
# tp Book.all, :author, "title"

# w = Workspace.new
# tp w, :channels

   # channels: lambda{|u| u.monthly_payment * 12}

# yearly_payment: lambda{|u| u.monthly_payment * 12}
# channels["channels"].map{|channel| channel["name"]}

# Need to figure out how to access in array of hashes to acces names for each channel


# users = User.list_all
# tp users
# tp users, :slack_id, :username, :real_name, :name
# puts users[1]
# puts users[1].slack_id





# channels = Channel.list_all
# puts channels[0]
# puts channels[0].channel_name
# tp channels


# puts channels["channels"]
# channel_names = channels["channels"].map{|channel| channel["name"]}
# tp channel_names

#
# response = HTTParty.get("https://slack.com/api/users.list", query: query)
# puts response