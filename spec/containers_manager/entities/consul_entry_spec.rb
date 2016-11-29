require 'spec_helper'
require 'ostruct'

describe ContainersManager::ConsulEntry do
  let(:subject) { ContainersManager::ConsulEntry.new(data, configuration) }

  describe '#deregister_if_possible' do
    let(:data) { fake_for(:consul_entry) }
    let(:configuration) { double(:configuration) }

    context 'can deregister' do
      let(:id_provider) { OpenStruct.new(alive_ids: ['6cf3975b77bb6963126d']) }

      it 'deregisters' do
        subject.set_id_provider(id_provider)
        expect(subject).to receive(:deregister)
        subject.deregister_if_possible
      end
    end

    context 'cannot deregister' do
      let(:id_provider) { OpenStruct.new(alive_ids: ['11111111111111111']) }

      it 'doesnt deregister' do
        subject.set_id_provider(id_provider)
        expect(subject).not_to receive(:deregister)
        subject.deregister_if_possible
      end
    end
  end
end
