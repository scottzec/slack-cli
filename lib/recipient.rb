require 'httparty'
require 'dotenv'

Dotenv.load

class Recipient
  attr_reader :slack_id

  def initialize(slack_id)
    @slack_id = slack_id
  end

  def self.get(url, params)
    response = HTTParty.get(url, query: params)
    raise ArgumentError.new("API call failed with code #{response.code} and error #{response['error']}") if response["ok"] == false
    return response
  end

  def send_message(message)

    body_param = {
        token: ENV["SLACK_TOKEN"],
        text: message,
        channel: @slack_id
    }
    response = HTTParty.post(
        "https://slack.com/api/chat.postMessage",
        body: body_param,
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    response_string = validate_post(response)

    return response_string

  end

  def self.list_all
    raise NotImplementedError.new("Implement me in a child class")
  end

  def details
    raise NotImplementedError.new("Implement me in a child class")
  end

  private

  def validate_post(response)
    raise ArgumentError.new("API call failed with code #{response.code} and error #{response['error']}") if response["ok"] == false
    return "Thank you this message was sent"
  end

  # Consider testing get method here instead of in user and recipient test files
end