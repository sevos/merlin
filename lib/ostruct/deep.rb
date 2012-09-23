require 'ostruct'

def OpenStruct.deep(obj)
  case obj
  when Array
    obj.map {|e| OpenStruct.deep(e)}
  when Hash
    OpenStruct.new( obj.each do |k,v|
      obj[k] = OpenStruct.deep(v)
    end )
  else
    obj
  end
end
