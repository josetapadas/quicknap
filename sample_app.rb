require './quicknap'

get '/' do
  "Taking a quick nap: #{params}!"
end

post '/' do
  "Posted: #{post_body}"
end

listen_at 6969
