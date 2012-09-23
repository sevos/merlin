module Merlin
  class Configuration
    def initialize(config_file_path, environment = ::Rails.env, connection = nil)
      @environment = environment
      @local_raw = from_file(config_file_path)
      @remote_raw = merlin_server ? from_server(connection) : {}
      @struct = OpenStruct.deep(@remote_raw.deep_merge(@local_raw))
    end

    def method_missing(name, *args, &block)
      @struct.send(name, *args, &block)
    end

    private

    def from_file(config_file_path)
      YAML.load(File.read(config_file_path))[@environment.to_s]
    end

    def from_server(connection = nil)
      connection ||= Faraday.new(merlin_server) do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end

      response = connection.get "/config/#{@environment}.json"
      if response.status == 200
        response.body
      else
        {}
      end
    rescue Faraday::Error::ConnectionFailed
      {}
    end

    private

    def merlin_server
      @local_raw['merlin']
    end
  end
end
