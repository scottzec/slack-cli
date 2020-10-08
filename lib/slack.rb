#!/usr/bin/env ruby
require_relative "workspace"

require "table_print"


def program_prompt
  puts "Please enter your selected option:"
  puts "- list users"
  puts "- list channels"
  puts "- quit"
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

  program_prompt
  input = validate_input(gets.chomp)
  until input == "quit"
    case input
    when "list users"
      tp users
    when "list channels"
      tp channels
    when "quit"
      exit
    end
    program_prompt
    input = validate_input(gets.chomp)
  end
  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME