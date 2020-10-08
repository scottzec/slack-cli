require_relative 'user'
require_relative 'channel'

class Workspace

  attr_reader :users, :channels

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
    # @selected = ""
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
    elsif @users.include?(selected)
      return_string = "some user stuff"
    else
      return_string = "No recipient selected"
    end

    return return_string
  end
end