#! /usr/bin/env ruby
# coding: utf-8

require "rubygems"
require "bundler/setup"

require "oauth"
require "json"
require "uri"

options = {}

File.open("key") do |f|
  options[:consumer_key] = f.gets.chomp
  options[:consumer_secret] = f.gets.chomp
  options[:access_token] = f.gets.chomp
  options[:access_token_secret] = f.gets.chomp
end

consumer = OAuth::Consumer.new(
  options[:consumer_key],
  options[:consumer_secret],
  :site => "https://www.flickr.com/services"
)

access_token = OAuth::AccessToken.new(
  consumer,
  options[:access_token],
  options[:access_token_secret]
)

response = access_token.get("https://api.flickr.com/services/rest/?method=flickr.contacts.getList&sort=time&format=json&nojsoncallback=1")
json = JSON.parse(response.body)

for user in json["contacts"]["contact"]
  id = user["nsid"]

  res = access_token.get("https://api.flickr.com/services/rest/?method=flickr.people.getInfo&format=json&nojsoncallback=1&user_id=" + URI.escape(id))
  info = JSON.parse(res.body)
  if info["person"]["revcontact"] == 0
    puts info["person"]["username"]["_content"]
  end
end
