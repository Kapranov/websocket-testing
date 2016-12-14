require 'em-websocket'
require 'json'
require 'optparse'

address = "127.0.0.1"
port = 3000

OptionParser.new do |opts|
  opts.banner = "Usage: bundle exec server.rb [options]"

  opts.on("-a", "--address", "Address") do |p|
    address = a
  end

  opts.on("-p", "--port PORT", Integer, "Port") do |p|
    port = Integer(p)
  end
end.parse!
