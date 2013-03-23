begin
  require 'webmock'
  WebMock.enable!
rescue LoadError
  nil
end
