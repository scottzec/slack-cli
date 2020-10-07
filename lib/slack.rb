#!/usr/bin/env ruby

require_relative "workspace"

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  # TODO: I should see information about how many channels and users were loaded

  puts "Please enter the number of your selected option:"
  puts "1. list users"
  puts "2. list channels"
  puts "3. quit"
  input = gets.chomp.to_i
  case input
  when 1
    print a list of users
  when 2
    print a list of the channels
  when 3
    exit
  end

  # TODO: After completing any command other than quit, the program should reprint the list of commands and ask for another input.
  # TODO: Entry is the word command, not #
  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME