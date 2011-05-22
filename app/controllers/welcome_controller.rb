require 'pp'
require 'amazon/ecs'
class WelcomeController < ApplicationController
  def index
    Amazon::Ecs.configure do |options|
      options[:aWS_access_key_id] = AWS_ACCESS_KEY_ID
      options[:aWS_secret_key] = AWS_SECRET_KEY
      options[:country] = :jp
    end
    res = Amazon::Ecs.item_search('ruby', {:response_group => 'Medium', :sort => 'salesrank'})
    @items = res.items
  end
end
