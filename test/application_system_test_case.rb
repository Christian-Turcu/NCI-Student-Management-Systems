require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument('--headless')
  chrome_options.add_argument('--disable-gpu')
  chrome_options.add_argument('--no-sandbox')
  chrome_options.add_argument('--disable-dev-shm-usage')

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: {
    browser: :remote,
    url: "http://localhost:4444/wd/hub",
    options: chrome_options
  }

  def accept_confirm
    # Accept the Turbo confirmation dialog
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept
  end
end
