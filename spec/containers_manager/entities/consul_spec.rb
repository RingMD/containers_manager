require 'spec_helper'

describe ContainersManager::Consul do
  let(:subject) { ContainersManager::Consul.new(configuration, id_provider) }
  let(:configuration) { double(:configuration) }
  let(:id_provider) { double(:id_provider) }

  describe '#all_entries' do
    let(:urls) { [
      'http://localhost:9200/v1/catalog/service/web',
      'http://localhost:9200/v1/catalog/service/realtime'
    ] }
    let(:consul_service) { double(:consul_service) }

    before do
      allow(configuration).to receive(:consul_service_urls).and_return(urls)
      allow(ContainersManager::ConsulService).to receive(:new).and_return(consul_service)
    end

    it 'returns all entries from all URLs from the configuration' do
      expect(consul_service).to receive(:services).with(urls[0]).and_return(fake_for(:get_consul_web))
      expect(consul_service).to receive(:services).with(urls[1]).and_return(fake_for(:get_consul_realtime))
      expect(subject.all_entries.count).to eq(3)
    end
  end
end
