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
# USER_LIST_URL = "https://slack.com/api/users.list?"

CHANNEL_LIST_URL = "https://slack.com/api/conversations.list"

# response = Channel.get(CHANNEL_LIST_URL, query)
# puts response["channels"][0]["purpose"]["value"]
# puts response["channels"][0]["topic"]

channels = Channel.list_all
puts channels[2].topic

# puts response.keys


# message = "test"
# user = "scottzec999"
# property = "name"
# workspace = Workspace.new
# selected = workspace.select_user(user, property)
# # puts selected
# # puts selected.class
# puts selected.send_message(message)


# message_receipt = selected.send_message(message)
# expect{selected.send_message(message)}.must_be_nil
#
# w = Workspace.new
# w.send_message("test message")

# puts query[:token]

# response = User.list_all
# puts response


# class ParentClass
#
#   def self.send_message(message)
#
#     body_param = {
#         token: ENV["SLACK_TOKEN"],
#         text: message,
#         channel: nil
#     }
#     # response = HTTParty.post(
#     #     "https://slack.com/api/chat.postMessage",
#     #     body: body_param,
#     #     headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
#     # )
#     #
#     # response_string = validate_post(response)
#     # return response_string
#     return body_param
#   end
#   #
#   # def self.send_message(message)
#   #   return "this is a message"
#   # end
#
# end

# class ChildClass < ParentClass
#
#   def self.send_message(message)
#     super
#     # body_param[:channel] = "general"
#     # return body_param
#   end
#
#   # def self.send_message(message)
#   #   return "#{message} : #{super}"
#   # end
# end

# parent = ParentClass.new
# puts ParentClass.send_message("this is a message")

# child = ChildClass.new
# puts ChildClass.send_message("new message")

