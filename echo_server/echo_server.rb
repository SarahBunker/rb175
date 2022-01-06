request_line = "GET /?rolls=6&sides=20 HTTP/1.1"

def parse_request(request_line)
  http_method, path_query, http_version = request_line.split
  path, query = path_query.split("?")
  params = query.split("&").map { |pair| pair.split("=") }.to_h
  [http_method, path, params]
end

http_method, path, params = parse_request(request_line)

rolls = params["rolls"].to_i
sides = params["sides"].to_i

rolls.times { puts rand(sides)+ 1}

