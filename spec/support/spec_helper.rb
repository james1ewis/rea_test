require_relative '../../lib/application'
require_relative '../../lib/input_parser'
require_relative '../../lib/position'
require_relative '../../lib/place_command'
require_relative '../../lib/command_factory'
require_relative '../../lib/simulator'
require_relative '../../lib/report_command'
require_relative '../../lib/Robot'
require_relative '../../lib/table'
require_relative '../../lib/move_command'
require_relative '../../lib/left_command'
require_relative '../../lib/right_command'
require_relative 'left_command_helpers'
require 'rspec'

RSpec.configure do |config|
  config.include(LeftCommandHelpers)
end
