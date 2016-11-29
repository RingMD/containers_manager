module ContainersManager
  class DockerService
    ALIVE_CONTAINER_ID_CMD = 'docker ps -q'

    def initialize(configuration)
      @configuration = configuration
    end

    def alive_ids
      system_call(ALIVE_CONTAINER_ID_CMD).split("\n")
    end

    private

    attr_reader :configuration

    def system_call(cmd)
      `DOCKER_HOST=:#{configuration.docker_host} #{cmd}`
    end
  end
end
