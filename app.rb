require 'rubygems'
require 'net/https'
require 'bundler'
require 'date'
require 'time'
require 'open-uri'

Bundler.require

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/IndCivicHack")

class Challenge
  include DataMapper::Resource
  property :id, Serial
  property :first_name, Text
  property :last_name, Text
  property :email, Text
  property :organization, Text
  property :challenge_desc, Text
  property :apis, Text
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

##############################################

get "/" do
  erb :index
end

get "/newchallenge" do
	erb :newchallenge
end
