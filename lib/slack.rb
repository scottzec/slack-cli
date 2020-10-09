#!/usr/bin/env ruby
require_relative "workspace"

require "table_print"

VALID_INPUT = ["list users", "list channels", "select channel", "select user", "send message", "details", "quit"]

def validate_property_type(property_type)
  property_type.downcase!
  valid_property_types = ["name", "id"]
  return false unless valid_property_types.include?(property_type)
  return true
end

def recipient_details(input, workspace)
  recipient_string = input.split(" ")[-1]
  puts "Please enter the #{recipient_string} you want to see information for. \nDo you want to enter an ID or a name?"
  property_type = gets.chomp
  until validate_property_type(property_type)
    puts "Please enter either name or ID"
    property_type = gets.chomp
  end
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
end

def program_prompt(users, channels, workspace)
  puts "Please enter your selected option:"
  puts "- list users"
  puts "- list channels"
  puts "- select channel"
  puts "- select user"
  puts "- send message"
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
  when "send message"
    puts "What message would you like to send?"
    message = gets.chomp
    puts workspace.send_message(message)
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