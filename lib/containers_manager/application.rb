module ContainersManager
  class Application
    CONFIG_FILE = '/etc/dmanage/config.yml'

    def self.exec
      load_configuration
      tasks.each(&:exec)
    end

    private

    def self.load_configuration
      Configuration.load(CONFIG_FILE)
    end

    def self.tasks
      [
        DeregisterTask
      ]
    end
  end
end
