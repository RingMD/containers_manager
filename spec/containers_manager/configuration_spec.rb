require 'spec_helper'

describe ContainersManager::Configuration do
  [
    {
      name: 'docker_host',
      value: 2375
    },
    {
      name: 'consul_deregister_url',
      value: 'localhost:8500/v1/agent/service/deregister'
    },
    {
      name: 'consul_service_urls',
      value: [
        'localhost:8500/v1/catalog/service/web',
        'localhost:8500/v1/catalog/service/realtime'
      ]
    }
  ].each do |data|
    describe ".#{data[:name]}" do
      let(:file_path) { File.expand_path('../../fixtures/config.yml', __FILE__) }

      it "returns #{data[:value]}" do
        ContainersManager::Configuration.load(file_path)
        expect(ContainersManager::Configuration.send(data[:name])).to eq(data[:value])
      end
    end
  end
end
