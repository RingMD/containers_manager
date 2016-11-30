module ContainersManager
  class ConsulEntry
    def initialize(data, configuration)
      @data          = data
      @configuration = configuration
    end

    def set_id_provider(id_provider)
      @id_provider = id_provider
      self
    end

    def deregister_if_possible
      deregister if can_deregister?
    end

    private

    attr_reader :data, :configuration, :id_provider

    def deregister
      ConsulService.new(configuration).deregister(service_id)
    end

    def can_deregister?
      id_provider.alive_ids.find { |id| service_id.include?(id) }.empty?
    end

    def service_id
      @service_id ||= data['ServiceID']
    end
  end
end
