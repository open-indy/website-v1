require 'sinatra'
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
  property :name, Text
  property :email, Text
  property :organization, Text
  property :challenge_desc, Text
  property :apis, Text
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

use Rack::Auth::Basic, "Protected Area" do |username, password|
  username == 'civic' && password == 'hack'
end

##############################################

get "/" do
	@data = Challenge.all
	@challengecount = DataMapper.repository.adapter.select("SELECT COUNT(id) FROM challenges").first.to_s
	erb :index
end

get "/newchallenge" do
	erb :newchallenge
end

get "/localchallenge" do
	@data = Challenge.all
	erb :localchallenge
end

post '/newchallenge' do
	n = Challenge.new
	n.name = params[:name]
	n.email = params[:email]
	n.organization = params[:organization]
	n.challenge_desc = params[:challenge_desc]
	n.apis = params[:apis]
	n.created_at = Time.now
	n.updated_at = Time.now
	n.save
	redirect '/'
end

get '/terms' do 
	erb :terms
end
