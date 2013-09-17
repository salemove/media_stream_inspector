require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'capybara/rspec'

require 'media_stream_inspector'

Capybara.run_server = false
Capybara.current_driver = :selenium_chrome

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.app_host = 'https://localhost.ssl:9876'
Capybara.default_driver = :selenium_chrome


describe MediaStreamInspector::StreamInspector do
  include Capybara::DSL

  before do
    visit '/'
  end

  it 'errors when non-existing target not found' do
    expect {
      described_class.new('#non-existing', page).detect_activity
      }.to raise_error(described_class::TargetElementNotFound)
  end

  it 'detects activity' do
    click_button('1. Ask user media')
    sleep 1
    click_button('2. Show stream')
    active_report = described_class.new('#local-video', page).detect_activity
    inactive_report = described_class.new('#video-as-if-remote', page).detect_activity
    expect(active_report.was_active?).to eq(true)
    expect(inactive_report.was_active?).to eq(false)
  end

  it 'detects inactivity' do
    report = described_class.new('#video-as-if-remote', page).detect_activity
    expect(report.was_active?).to eq(false)
  end
end
