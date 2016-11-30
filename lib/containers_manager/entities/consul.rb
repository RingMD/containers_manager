module ContainersManager
  class Consul
    def initialize(configuration, id_provider)
      @configuration = configuration
      @id_provider   = id_provider
    end

    def all_entries
      @all_entries ||= response_from(consul_service_urls).map do |node|
        ConsulEntry.new(node, configuration).set_id_provider(id_provider)
      end
    end

    private

    attr_reader :configuration, :id_provider

    def consul_service_urls
      @configuration.consul_service_urls
    end

    def response_from(param)
      if param.is_a?(String)
        consul_service.services(param)
      elsif param.is_a?(Array)
        param.map { |e| response_from(e) }.flatten
      end
    end

    def consul_service
      @consul_service ||= ConsulService.new(configuration)
    end
  end
end
