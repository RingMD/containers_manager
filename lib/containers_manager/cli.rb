require "thor"

module ContainersManager
  class Cli < Thor
    include Thor::Actions

    desc 'exec', 'Execute jobs to manage containers'
    def exec
      exception_rescue do
        Application.exec
      end
    end

    desc 'check', 'Output the configuration'
    def exec
      exception_rescue do
        Application.check
      end
    end

    private

    def exception_rescue
      yield
    rescue Exception => e
      $stdout.puts(e.message)
    end
  end
end
