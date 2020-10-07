require 'httparty'

class Recipient
  attr_reader :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def self.get(url, params)
    response = HTTParty.get(url, query: params)
    raise ArgumentError.new("API call failed with code #{response.code} and error #{response['error']}") if response["ok"] == false
    return response
  end

  def self.list_all
    raise NotImplementedError.new("Implement me in a child class")
  end

  def details
    raise NotImplementedError.new("Implement me in a child class")
  end

  # Consider testing get method here instead of in user and recipient test files
end