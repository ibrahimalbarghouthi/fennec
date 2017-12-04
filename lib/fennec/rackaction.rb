module Fennec
  class Routes

    def self.find(verb,path)
      if Fennec.routes.index("#{verb.downcase} #{path.downcase}")
        block = Fennec.blocks[Fennec.routes.index("#{verb.downcase} #{path.downcase}")].call
      else
        "404 page not found"
      end
    end
  end

  class Run
    attr_writer :app

    def self.call(env)
      Fennec.request = Rack::Request.new env
      Fennec.params = Fennec.request.params
      [200, {"Content-Type" => "text/html"}, [Fennec::Routes.find(env["REQUEST_METHOD"],env["REQUEST_PATH"])]]
    end
  end
end

