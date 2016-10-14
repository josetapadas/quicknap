require 'rack'

module QuickNap
  class Base
    def initialize
      @routes = {}
      @request = {}
    end

    attr_reader :routes, :request

    def get(route, &callback)
      route("GET", route, &callback)
    end

    def post(route, &callback)
      route("POST", route, &callback)
    end

    def patch(route, &callback)
      route("PATCH", route, &callback)
    end

    def put(route, &callback)
      route("PUT", route, &callback)
    end

    def delete(route, &callback)
      route("DELETE", route, &callback)
    end

    def call(env)
      @request = Rack::Request.new(env)

      http_verb = @request.request_method
      requested_route = @request.path_info

      handler = @routes.fetch(http_verb, {}).fetch(requested_route, nil)

      if handler
        request_result = instance_eval(&handler)
        (request_result.class == String) ? [200, {}, [request_result]] : request_result
      else
        [404, {}, ["'#{http_verb}' to '#{requested_route}' : Undefined route"]]
      end
    end

    private

    def route(http_verb, route, &callback)
      @routes[http_verb] ||= {}
      @routes[http_verb][route] = callback
    end

    def params
      @request.params
    end

    def post_body
      @request.body.read
    end
  end

  QuickNapApp = Base.new

  module Delegator
    def self.delegate(*methods, to:)
      Array(methods).each do |method_name|
        define_method(method_name) do |*args, &block|
          to.send(method_name, *args, &block)
        end

        private method_name
      end
    end

    delegate :get, :patch, :put, :post, :delete, :head, to: QuickNapApp
  end
end

include QuickNap::Delegator
