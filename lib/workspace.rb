require_relative 'user'
require_relative 'channel'

class Workspace < Recipient

  attr_reader :users, :channels

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
    @selected = nil
  end

  def send_message(message)
    @selected.send_message(message)
  end

  def send_message(message)

    # TODO: DRY THIS UP WITH SUPER
    body_param = {
        token: ENV["SLACK_TOKEN"],
        text: message,
        # this will only work for channels and not users
        channel: @selected.channel_name
    }

    response = HTTParty.post(
        "https://slack.com/api/chat.postMessage",
        body: body_param,
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    # response_string = validate_post(response)
    raise ArgumentError.new("API call failed with code #{response.code} and error #{response['error']}") if response["ok"] == false
    # return response_string
    return "Thanks"

  end

  def select_user(user, property)
    if property == "id"
      selected_user = users.find{|user_instance| user_instance.slack_id == user}
    elsif property == "name"
      selected_user = users.find{|user_instance| user_instance.username == user}
    end
    @selected = selected_user
    return selected_user
  end

  def select_channel(channel, property)
    if property == "id"
      selected_channel = channels.find{|channel_instance| channel_instance.slack_id == channel}
    elsif property == "name"
      selected_channel =  channels.find{|channel_instance| channel_instance.channel_name == channel}
    end
    @selected = selected_channel
    return selected_channel
  end


  def show_details
    if @channels.include?(@selected)
      return_string = "This is channel #{@selected.channel_name}, its topic is #{@selected.topic}. Its slack_id is #{@selected.slack_id}, and it has a member count of #{@selected.member_count}"
    elsif @users.include?(@selected)
      return_string = "This is user #{@selected.username}. Their real name is #{@selected.real_name} and their slack id is #{@selected.slack_id}"
    else
      return_string = "No recipient selected"
    end

    return return_string
  end
end