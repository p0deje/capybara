module Capybara
  module Selenium
    module LoggerSuppressor
      def deprecate(*)
        super unless @suppress_for_capybara
      end

      def suppress_deprecations
        @suppress_for_capybara = true
        yield
      ensure
        @suppress_for_capybara = false
      end
    end
  end
end

Selenium::WebDriver::Logger.prepend Capybara::Selenium::LoggerSuppressor
