require 'sinatra'
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

get "/2014" do
	erb :innagural
end

get "/newchallenge" do
	erb :newchallenge
end

get "/codeofconduct" do 
	erb :codeofconduct
end

get "/brigade" do 
	erb :index
end

get "/localchallenge" do
	@data = Challenge.all
	erb :localchallenge
end

get '/terms' do 
	erb :terms
end

get '/ndoch2015' do
	erb :ndoch2015
end

get '/tweets' do
	erb :tweets
end

get '/maillist' do
	erb :maillist
end

