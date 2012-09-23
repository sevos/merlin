require 'ostruct'

def OpenStruct.deep(obj, freeze = false)
  case obj
  when Array
    obj.map {|e| OpenStruct.deep(e, freeze)}
  when Hash
    OpenStruct.new( obj.each do |k,v|
      obj[k] = OpenStruct.deep(v, freeze)
    end )
  else
    obj
  end.tap { |res| res.freeze if freeze }
end
