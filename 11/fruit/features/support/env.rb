require 'childprocess'
require 'timeout'
require 'httparty'

server = ChildProcess.build('rackup', '--port', '9292')
server.start
Timeout.timeout(3) do
  loop do
    begin
      HTTParty.get('http://localhost:9292')
      break
    rescue Errno::ECONNREFUSED => try_again
      sleep 0.1
    end
  end
end

at_exit do
  server.stop
end

After do
  File.delete 'fruits.json'
end