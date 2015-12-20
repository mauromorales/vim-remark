require 'vimrunner'
require 'vimrunner/rspec'
require "given_filesystem/spec_helpers"

Vimrunner::RSpec.configure do |config|
  # Use a single Vim instance for the test suite. Set to false to use an
  # instance per test (slower, but can be easier to manage).
  config.reuse_server = false

  # Decide how to start a Vim instance. In this block, an instance should be
  # spawned and set up with anything project-specific.
  config.start_vim do
    vim = Vimrunner.start

    # Or, start a GUI instance:
    # vim = Vimrunner.start_gvim

    # Setup your plugin in the Vim instance
    plugin_path = File.expand_path('../..', __FILE__)
    vim.add_plugin(plugin_path, 'plugin/remark.vim')

    # The returned value is the Client available in the tests.
    vim
  end
end

def root_path
  File.join(File.dirname(__FILE__), "..")
end

def given_directory_from_test_data(name)
  Dir.chdir(root_path) do
    given_directory_from_data name
  end
end
