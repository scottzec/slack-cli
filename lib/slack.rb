#!/usr/bin/env ruby
require_relative "workspace"

require "table_print"


def program_prompt(users, channels, workspace)
  puts "Please enter your selected option:"
  puts "- list users"
  puts "- list channels"
  puts "- select channel"
  puts "- select user"
  puts "- details"
  puts "- quit"

  input = validate_input(gets.chomp)
  case input
  when "list users"
    tp users
  when "list channels"
    tp channels
  when "select channel"
    puts "Please enter the channel you want to see information for. \nDo you want to enter an ID or a name?"
    property = gets.chomp
    puts "Thanks! Please enter it"
    user_channel = gets.chomp
    channel = workspace.select_channel(user_channel, property)
    if channel == nil
      puts "This channel doesn't exist! Exiting..."
    end
  when "details"
    puts workspace.show_details
  when "quit"
    exit
  end
  return input
end

def validate_input(input)
  input.downcase!
  valid_input = ["list users", "list channels", "quit"]
  raise ArgumentError.new("Not a valid input") if valid_input.include?!(input)
  return input
end

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  users = workspace.users
  channels = workspace.channels

  puts "There are #{users.length} users and #{channels.length} channels in this workspace"

  input = program_prompt(users, channels, workspace)
  until input == "quit"
    input = program_prompt(users, channels, workspace)
  end
  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME