require 'rails_helper'
include Capybara::DSL

describe "Page" do

  before (:all) do
    Capybara.run_server = false
    Capybara.current_driver = :selenium
    Capybara.app_host = 'http://www.cs.helsinki.fi/u/chra/toka.html'

  end

  it "can view index" do
    visit "/"

    puts page
  end

end
