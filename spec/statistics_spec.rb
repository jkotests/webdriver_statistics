require_relative 'spec_helper'

describe 'WebDriver Statistics' do

  let(:driver) {Selenium::WebDriver.for :chrome}
  let(:html) { File.expand_path(File.dirname(__FILE__) + '/html/test.html') }
  let(:statistics) {driver.statistics}

  after(:each) do
    driver.quit
  end

  specify 'records total command count' do
    driver.get "file://#{html}"
    driver.title
    expect(statistics.total_executions).to eql(2)
  end

  specify 'records counts for each command' do
    driver.get "file://#{html}"
    driver.title

    expect(statistics.commands[:get][:passed]).to eql(1)
    expect(statistics.commands[:getTitle][:passed]).to eql(1)
  end

end
