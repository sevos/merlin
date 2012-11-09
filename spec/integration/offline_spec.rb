require 'spec_helper'

describe 'dummy app' do
  context 'when only yaml file is available' do
    it 'responds with app name' do
      visit '/name'
      page.should have_content('Dummy app test')
    end
  end

  context 'when configuration server is available' do
    let(:json_config) { {"dummy" => {"name" => "super app", "version" => 5}}}
    let(:dump_filepath) { File.join(Rails.root, "tmp", "merlin_offline_dump.yml") }
    let(:stubs) {
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('/config/production.json') { [200, {}, json_config] }
      end
    }

    before do
      File.open(dump_filepath, "w") { |file| file.puts(YAML.dump({})) }
    end

    it 'fetches config from server but overrides it with local config' do
      conn = Faraday.new('http://localhost') do |conn|
        conn.adapter :test, stubs
      end

      config = Merlin::Configuration.new(File.join(Rails.root, 'config', 'merlin.yml'),
                                         'production', conn)
      config.dummy.name.should == 'Dummy app test'
      config.dummy.version.should == 5
    end
  end
end
