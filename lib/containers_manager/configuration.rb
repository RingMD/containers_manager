require 'yaml'

module ContainersManager
  class Configuration
    def self.load(file_path)
      raise "#{file_path} cannot be found" unless File.exists?(file_path)

      @file_path = file_path
      @data      = YAML.load_file(file_path)
    end

    private

    def self.method_missing(method_name, *args, &block)
      value = @data[method_name.to_s]
      raise "Attribute '#{method_name}' cannot be found in the #{@file_path}" unless value
      value
    end
  end
end
