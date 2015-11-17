# RakeTools

A set of tools for Rake and Ruby workflows, including:

* `parent_task`: Automatically run all sub-tasks in a namespace when the namespace-named task is run.
* Limit the number of Rake threads to a sane number by default.
* Lint metric for code volume if `cloc` is installed.
* Ruby style enforcement, and slightly saner Rubocop defaults.
* Dependency checking with `bundler-audit`, and `bundle outdated`.


## Installation

Add this line to your application's Gemfile:

```ruby
gem "rake-tools", require: false, git: "git@github.com:MrJoy/rake-tools.git"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install rake-tools
```


## Usage

TODO: Write usage instructions here.  Hint, try `rake -T`.

### Setup

1. In `Rakefile`, add this -- replacing the domain name with the URL of your private Docker registry:
    ```ruby
    require "rubygems"
    require "bundler/setup"
    Bundler.require(:default, :development, :test)
    require "rake_tools"
    RakeTools.init!
    ```
1. Create a file named `.rubocop.local.yml` with your own Rubocop rules / configuration.
    * This will be merged with the saner defaults provided by `rake-tools` when running `rake lint:rubocop`.
1. Add `/.rubocop.yml` to your `.gitignore` file, as this will be auto-generated.

### Running The Tools

```bash
rake lint # Run all `lint:*` tasks.  Includes `bundler-audit` and `Rubocop` by default.
```

### Custom Lint Tasks

To add a task that gets executed when you run `rake lint`, simply create it in the `lint` namespace:

```ruby
namespace :lint do
  desc "Some sort of lint check for your project.  Will be included in `rake lint` automatically."
  task :my_check do
  end
end
```

### Making Your Own Auto-Discovery Task Groups

```ruby
desc "Run all `my_group:*` tasks."
parent_task :my_group

namespace :my_group do
  desc "Some task to include in `rake my_group`."
  task :some_task do
  end
end
```


## Contributing

1. Fork it ( https://github.com/MrJoy/rake-tools/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
