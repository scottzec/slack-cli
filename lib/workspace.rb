require_relative 'user'
require_relative 'channel'

class Workspace

  attr_reader :users, :channels

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
  end

  def show_details

    # channel_names = channels["channels"].map{|channel| channel["name"]}

    return users, channels
  end
end