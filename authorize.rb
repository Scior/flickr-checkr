#! /usr/bin/env ruby
# coding: utf-8

require "rubygems"
require "bundler/setup"

require "oauth"

key = ""
secret = ""

File.open("key") do |f|
  key = f.gets.chomp
  secret = f.gets.chomp
end

consumer = OAuth::Consumer.new(key, secret, :site => "https://www.flickr.com/services")
request_token = consumer.get_request_token

puts request_token.authorize_url
puts "Enter your PIN code"

pin = gets.chomp

access_token = request_token.get_access_token(:oauth_verifier => pin)

File.open("key", "w") do |f|
  f.puts(key)
  f.puts(secret)
  f.puts(access_token.token)
  f.puts(access_token.secret)
end
