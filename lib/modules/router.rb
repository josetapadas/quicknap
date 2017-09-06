module QuickNap
  module Router
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
  end
end
