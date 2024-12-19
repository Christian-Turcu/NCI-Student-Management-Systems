require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: {
    browser: :remote,
    url: "http://localhost:4444/wd/hub",
    capabilities: [
      Selenium::WebDriver::Chrome::Options.new(
        args: %w[headless disable-gpu no-sandbox]
      )
    ]
  }

  def accept_confirm
    # Accept the Turbo confirmation dialog
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept
  end
end
