require 'containers_manager/version'

require 'containers_manager/configuration'

require 'containers_manager/services/consul_service'
require 'containers_manager/services/docker_service'

require 'containers_manager/entities/docker'
require 'containers_manager/entities/consul_entry'
require 'containers_manager/entities/consul'

require 'containers_manager/tasks/task'
require 'containers_manager/tasks/deregister_task'

require 'containers_manager/application'

require 'containers_manager/cli'

module ContainersManager
  # Your code goes here...
end
