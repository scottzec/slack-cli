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
    raise ArgumentError.new("This recipient doesn't exist") unless @selected
    @selected.send_message(message)
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