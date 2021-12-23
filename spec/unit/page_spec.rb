require 'capybara'
require 'capybara/dsl'

describe "Page render unit tests" do
    it "Should show the website logo" do
        visit('/')
        expect(page.has_selector? 'a.logo').to be_true
    end
end