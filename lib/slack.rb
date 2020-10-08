#!/usr/bin/env ruby
require_relative "workspace"

require "table_print"

VALID_INPUT = ["list users", "list channels", "select channel", "select user", "details", "quit"]

def recipient_details(input, workspace)
  recipient_string = input.split(" ")[-1]
  puts "Please enter the #{recipient_string} you want to see information for. \nDo you want to enter an ID or a name?"
  property_type = gets.chomp
  puts "Thanks! Please enter it"
  name_or_id = gets.chomp
  if recipient_string == "channel"
    recipient = workspace.select_channel(name_or_id, property_type)
  elsif recipient_string == "user"
    recipient = workspace.select_user(name_or_id, property_type)
  end
  if recipient == nil
    puts "This #{recipient_string} doesn't exist! Exiting..."
  end
  # return recipient
end

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
    recipient_details(input, workspace)
  when "select user"
    recipient_details(input, workspace)
  when "details"
    puts workspace.show_details
  when "quit"
    exit
  end
  return input
end

def validate_input(input)
  input.downcase!
  raise ArgumentError.new("Not a valid input") unless VALID_INPUT.include?(input)
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