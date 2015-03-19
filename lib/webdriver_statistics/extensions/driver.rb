module Selenium
  module WebDriver
    class Driver
      def statistics
        @bridge.statistics
      end

      alias_method :webdriver_quit, :quit
      alias_method :webdriver_close, :close

      def quit
        webdriver_quit
        puts statistics.to_s
      end

      def close
        number_windows = window_handles.size
        webdriver_close
        puts statistics.to_s if number_windows == 1
      end
    end
  end
end
