require "rdiscount"

module Rack
  class RackDiscount
    def initialize(app, options)
      @my_path_info = String.new
      @app = app
    end

    def call(env)
      status, headers, @response = @app.call(env)
      [status, headers, self]
    end

    def each(&block)
      @response.each { |x|
        markdown = RDiscount.new("#{x}")
        yield markdown.to_html
      }
    end
  end
end

