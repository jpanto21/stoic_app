require "sinatra"
require "sinatra/reloader"
require "http"
require "json"


get("/") do
  erb(:home)
end

get("/stoic_quotes") do
  raw_data = HTTP.get("https://stoic.tekloon.net/stoic-quote")
  @author = JSON.parse(raw_data).fetch("author")
  @quote = JSON.parse(raw_data).fetch("quote")

  
  erb(:stoic)
end

get("/motivation") do
  raw_data = HTTP.get("https://api.adviceslip.com/advice")
  parsed_data = JSON.parse(raw_data).fetch("slip")
  @advice = parsed_data.fetch("advice")

  erb(:motivation)
end
