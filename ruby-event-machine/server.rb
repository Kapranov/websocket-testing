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

EM.epoll
EM.run {
  @channel = EM::Channel.new

  EM::WebSocket.run(:host => address, :port => port) do |ws|
    ws.onopen {
      @channel.subscribe {|msg| ws.send msg }
    }

    ws.onmessage { |msg|
      cmd, payload = JSON(msg).values_at('type', 'payload')
      if cmd == 'echo'
        ws.send({type: 'echo', payload: payload}.to_json)
      else
        @channel.push({type: 'broadcast', payload: payload}.to_json)
        ws.send({type: "broadcastResult", payload: payload}.to_json)
      end
    }
  end
}
