require "pathname"
require "shellwords"

require "rake/clean"

# A set of helpers for Rake-driven projects, aimed especially at streamlining Rake workflows.
module RakeTools
  # Initialize `rake-tools`.  Configures Rake, and loads some handy tasks.
  def self.init!
    # TODO: Pare this to CPU count, or possibly half that because hyperthreading usually is not our
    # TODO: friend.
    Rake.application.options.thread_pool_size ||= 4
    # Time.zone = 'America/Los_Angeles'

    task_files.each { |fname| load fname }
  end

protected

  def self.task_files
    task_dir        = File.expand_path("../../../tasks", __FILE__)
    raw_task_files  = FileList["#{task_dir}/**/*.rake"] +
                      FileList["tasks/**/*.rake"]
    raw_task_files
      .map { |fname| File.expand_path(fname) }
      .sort
      .uniq
  end
end

require "rake_tools/monkey_patches"
require "rake_tools/version"
require "rake_tools/dsl"

# TODO: Make this optional.
include RakeTools::DSL
