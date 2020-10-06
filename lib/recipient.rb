require 'httparty'

class Recipient
  attr_reader :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def self.get(url, params)
    response = HTTParty.get(url, query: params)
    return response
  end

  def self.list_all
    raise NotImplementedError.new("Implement me in a child class")
  end

  def details
    raise NotImplementedError.new("Implement me in a child class")
  end

end