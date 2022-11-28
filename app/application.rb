# frozen_string_literal: true
ActiveRecord::Base.raise_in_transactional_callbacks = true
ENV['ENVIRONMENT'] ||= 'development'

require 'pg'
require 'active_record'
require 'dotenv'
require 'yaml'
require 'erb'

require 'app/runner'

Dotenv.load(".env.#{ENV.fetch('ENVIRONMENT')}.local", ".env.#{ENV.fetch('ENVIRONMENT')}", '.env')

def db_configuration
  db_configuration_file_path = File.join(File.expand_path('..', __dir__), 'db', 'database.yml')
  db_configuration_result = ERB.new(File.read(db_configuration_file_path)).result

  YAML.safe_load(db_configuration_result, aliases: true)
end

include ActiveRecord::Tasks
DatabaseTasks.database_configuration = YAML.load_file('database.yml')
DatabaseTasks.db_dir = 'db'

ActiveRecord::Base.establish_connection(db_configuration[ENV['ENVIRONMENT']])

module Application
  class Error < StandardError; end
  # Your code goes here...
end
