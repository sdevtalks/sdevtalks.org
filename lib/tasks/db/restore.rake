# frozen_string_literal: true

require "open3"

namespace :db do
  desc "Re-create local db and import data from heroku"
  task :restore do
    Open3.popen3("heroku whoami") do |stdin, stdout, stderr|
      raise "not logged in" if stderr.read == "Error: not logged in"
    end

    database_url =
      Open3.popen3("heroku config") do |stdin, stdout, stderr|
        puts stderr.read

        result = stdout.read
        result.gsub!("=== sdevtalks Config Vars\n", "")

        config = YAML.load(result)
        raise if config["DATABASE_URL"].blank?

        Rake::Task["db:drop"].invoke
        Rake::Task["db:create"].invoke

        config["DATABASE_URL"]
      end

    dump_file_name = "dump_#{Time.zone.now.to_i}.sql"
    Open3.popen3("pg_dump #{database_url} > #{dump_file_name}") do |stdin, stdout, stderr|
      puts stderr.read
      puts stdout.read
    end

    Open3.popen3("psql sdevtalks_org_development < #{dump_file_name}") do |stdin, stdout, stderr|
      puts stderr.read
      puts stdout.read

      FileUtils.rm(dump_file_name)
    end
  end
end
