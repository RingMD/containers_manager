$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'containers_manager'

load File.expand_path('../fixtures/data_sets.rb', __FILE__)

Dir[File.expand_path('../supports/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.include FakeData
end
