module ContainersManager
  class DeregisterTask < Task
    def self.exec
      deregister
    end

    private

    def self.deregister
      consul.all_entries.each(&:deregister_if_possible)
    end

    def self.consul
      @consul ||= Consul.new(
        configuration,
        id_provider
      )
    end

    def self.configuration
      @configuration ||= Configuration.instance
    end

    def self.id_provider
      @id_provider ||= Docker.new(configuration)
    end
  end
end
