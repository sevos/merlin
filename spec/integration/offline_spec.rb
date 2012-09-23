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
    let(:stubs) {
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('/config/test.json') { [200, {}, json_config] }
      end
    }

    it 'fetches config from server but overrides it with local config' do
      conn = Faraday.new('http://test.host') do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter :test, stubs
      end

      config = Merlin::Configuration.new(File.join(Rails.root, 'config', 'merlin.yml'),
                                         'test', conn)

      config.dummy.name.should == 'Dummy app test'
      config.dummy.version.should == 5
    end
  end
end
