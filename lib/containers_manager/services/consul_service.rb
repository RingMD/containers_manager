require 'json'

module ContainersManager
  class ConsulService
    def initialize(configuration)
      @configuration = configuration
    end

    def services(url)
      resp = `curl -sSL #{url}`
      JSON.parse(resp)
    end

    def deregister(id)
      system("curl -XPUT #{@configuration.consul_deregister_url}/#{id}")
    end

    private

    attr_reader :configuration
  end
end
