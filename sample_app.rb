require './quicknap'

get '/' do
  "Taking a quick nap: #{params}!"
end

post '/' do
  "Posted: #{post_body}"
end

Rack::Handler::WEBrick.run QuickNap::QuickNapApp, Port: 6969
