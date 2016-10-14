# Quick Nap

_A quick way to get some REST_

A Ruby lib to swifly create a simple web application.

## Installation

Install the gem:

    gem install quicknap
    
Or add it to your `Gemfile`:

    gem 'quicknap'

## Example

    require 'quicknap'

    get '/' do
      "Taking a quick nap: #{params}!"
    end

    post '/' do
      "Posted: #{post_body}"
    end

    listen_at 6969
    
### Running

    ruby quicknap_app.rb

Still under "heavy" development, feel free to contribute.
