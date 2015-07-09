require 'rails_helper'
include Capybara::DSL

describe "Page" do

  before (:each) do
    Capybara.run_server = false
    Capybara.current_driver = :selenium
    Capybara.app_host = 'http://www.cs.helsinki.fi/u'

  end

  it "has correct title" do
    visit "/chra/toka.html"

    expect(page.title).to eq("Mun sivu")
  end

  it "can navigate to second page" do
    visit "/chra/toka.html"

    click_link "Eka sivu"
    expect(page).to have_selector(:link_or_button, "Toka sivu")
    expect(page).not_to have_selector(:link_or_button, "Eka sivu")
  end
end
