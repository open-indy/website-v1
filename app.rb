require 'rubygems'
require 'net/https'
require 'bundler'
require 'date'
require 'time'
require 'open-uri'

Bundler.require


##############################################

get "/" do
  erb :index
end

get "/map" do
  erb :map
end

