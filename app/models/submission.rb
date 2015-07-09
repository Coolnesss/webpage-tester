require 'rspec-rails'
require 'rspec/core'

class Submission < ActiveRecord::Base
  def runTests
    config = RSpec.configuration
    formatter = RSpec::Core::Formatters::JsonFormatter.new(config.output_stream)
    # create reporter with json formatter
    reporter =  RSpec::Core::Reporter.new(config)
    config.instance_variable_set(:@reporter, reporter)
    loader = config.send(:formatter_loader)
    notifications = loader.send(:notifications_for, RSpec::Core::Formatters::JsonFormatter)
    reporter.register_listener(formatter, *notifications)
    RSpec::Core::Runner.run(['spec'])
    formatter.output_hash
  end

  def getPoints
    result = self.runTests
    puts result[:summary_line]
    result[:summary_line][0,1]
  end
end
