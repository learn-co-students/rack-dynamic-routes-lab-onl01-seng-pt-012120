class Application

    @@items = [
              # Item.new('Figs', 2.50)
    ]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
  
      if req.path.match(/items/)
        path_item = req.path.split("/items/").last
        if found_item = @@items.find {|item| item.name == path_item}
          resp.write "#{found_item.price}"
        else
          resp.write "Item not found"
          resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
      resp.finish
    end
  
  end