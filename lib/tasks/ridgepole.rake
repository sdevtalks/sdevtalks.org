# frozen_string_literal: true

namespace :ridgepole do
  desc 'Apply'
  task :apply do
    sh 'ridgepole', '-c', 'config/database.yml', '--apply', '-f', 'db/schemata/Schemafile', '-E', Rails.env
  end

  desc 'Dry run'
  task :dry_run do
    sh 'ridgepole', '-c', 'config/database.yml', '--apply', '--dry-run', '-f', 'db/schemata/Schemafile', '-E', Rails.env
  end
end
