module ContainersManager
  class Task
    def self.exec
      raise 'It should be overriden'
    end
  end
end
