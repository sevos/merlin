require 'ostruct'
require 'json'

class OpenStruct
  def to_json
    table.to_json
  end
end
