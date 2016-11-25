require "thor"

module ContainersManager
  class Cli < Thor
    include Thor::Actions

    desc 'exec', 'Execute jobs to manage containers'
    def exec
      Application.exec
    rescue Exception => e
      $stdout.puts(e.message)
    end
  end
end
