module ContainersManager
  class Application
    def self.exec
      tasks.each(&:exec)
    end

    private

    def self.tasks
      [
        DeregisterTask
      ]
    end
  end
end
