# Changes

## Next Version

## v0.3.0 - 2016-03-30 - Usability / streamlining.

* Update for RuboCop deprecations.
* Don't complain about filename for `Gemfile` and `Rakefile`.
* Let RSpec suites have long lines, so you always get the full assertion statement on a test failure.
* Produce more detailed output if it's provided in the config by adding `--extra-details` and `--display-style-guide` options.
* ALlow newer versions of Rake.


## v0.2.0 - 2016-01-02 - RuboCop 0.36.0, style touchups.

* Updates for RuboCop 0.36.0:
    * Change from `Style/TrailingComma` to `Style/TrailingCommaInLiteral`.
    * Change from `MultiSpaceAllowedForOperators` to `AllowForAlignment`.
    * Update from `'String#%'` to `percent` in `Style/FormatString`.
* A couple minor style touchups.


## v0.1.2 - 2016-01-05 - Bug fix.

* Fix an embarassing typo that made the `lint:cloc` task never usable.


## v0.1.1 - 2015-11-17 - Bug fixes.

* Fix for bug causing built-in `lint` tasks to not be loaded due to files being moved around in project.


## v0.1.0 - 2015-11-17 - Initial release.

* Initial release, hoisted from `docker-tools` project.
