# frozen_string_literal: true

require "open3"

class DatabaseRestore
  def run!
    dump_file_name = dump

    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke

    restore(dump_file_name)
  end

  def dump
    Open3.popen3("heroku whoami") do |stdin, stdout, stderr|
      raise "not logged in" if stderr.read == "Error: not logged in"
    end

    database_url =
      Open3.popen3("heroku config") do |stdin, stdout, stderr|
        puts stderr.read

        result = stdout.each_line.to_a[1..-1].join

        config = YAML.load(result)
        raise if config["DATABASE_URL"].blank?

        config["DATABASE_URL"]
      end

    dump_file_name = "tmp/dump_#{Time.now.to_i}.sql"
    Open3.popen3("pg_dump #{database_url} > #{dump_file_name}") do |stdin, stdout, stderr|
      puts stderr.read
      puts stdout.read
    end

    dump_file_name
  end

  def restore(dump_file_name)
    Open3.popen3("psql sdevtalks_org_development < #{dump_file_name}") do |stdin, stdout, stderr|
      puts stderr.read
      puts stdout.read

      FileUtils.rm(dump_file_name)
    end
  end
end

namespace :db do
  desc "Re-create local db and import data from heroku"
  task :restore do
    DatabaseRestore.new.run!
  end
end
