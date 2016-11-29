module ContainersManager
  class Docker
    def initialize(configuration)
      @configuration = configuration
    end

    def alive_ids
      docker_service.alive_ids
    end

    private

    attr_reader :configuration

    def docker_service
      @docker_service ||= DockerService.new(configuration)
    end
  end
end
