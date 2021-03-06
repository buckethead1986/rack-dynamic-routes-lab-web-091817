class Application

@@items = []


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if find_item(item_name)
        resp.write "#{find_item(item_name).price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
      # resp.write "#{item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def find_item(item_name)
    @@items.find{|item| item.name == item_name}
  end
end
