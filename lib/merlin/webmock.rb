begin
  require 'webmock'
  WebMock.allow_net_connect!
rescue LoadError
  nil
end
