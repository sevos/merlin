require 'spec_helper'

describe Merlin::Configuration do
  subject { Merlin::Configuration.new(File.join('spec', 'fixtures', 'config', 'merlin.yml'), "test") }

  let(:remote_config) { { 'service'=> data } }
  let(:data) { { 'url' => url } }
  let(:url) { 'http://some-service.com' }

  before do
    Merlin::Configuration.any_instance.stub(:merlin_server).and_return(true)
    Merlin::Configuration.any_instance.stub(:from_server).and_return(remote_config)
  end

  it 'responds to method chain' do
    subject.service.url.should == url
  end

  it 'converts to json' do
    subject.service.to_json.should == data.to_json
  end
end
