module OrderlyGarden
  # Rake DSL constructs.
  module DSL
    # Create and manage a temp file, replacing `fname` with the temp file, if `fname` is provided.
    def with_tempfile(fname = nil, &block)
      Tempfile.open("tmp") do |f|
        block.call(f.path, f.path.shellescape)
        FileUtils.cp(f.path, fname) unless fname.nil?
      end
    end

    # Write an array of strings to a file, adding newline separators, and
    # ensuring a trailing newline at the end of a file.
    def write_file(file_name, file_contents)
      contents =  file_contents
                  .flatten
                  .select { |line| line }
                  .join("\n")
      File.open(file_name, "w") do |fh|
        fh.write(contents)
        fh.write("\n")
      end
    end

    # Define a task named `name` that runs all tasks under an identically named `namespace`.
    def parent_task(name)
      task name do
        Rake::Task
          .tasks
          .select { |t| t.name =~ /^#{name}:/ }
          .sort { |a, b| a.name <=> b.name }
          .each(&:execute)
      end
    end
  end
end
