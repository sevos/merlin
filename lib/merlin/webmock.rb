begin
  require 'webmock'
  WebMock.disable_net_connect!(allow: /herokuapp.com/)
rescue LoadError
  nil
end