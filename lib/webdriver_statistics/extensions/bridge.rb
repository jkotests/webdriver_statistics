module Selenium
  module WebDriver
    module Remote
      class Bridge

        alias_method :webdriver_execute, :execute

        def execute(*args)
          statistics.log "Commands: #{args}"

          command = args[0]

          begin
            return_value = webdriver_execute(*args)
            statistics.send(command)
          rescue Exception => ex
            statistics.send(command, ex.class)
            raise
          end

          statistics.log "Return: #{return_value}" if return_value
          return_value
        end

        def statistics
          @statistics ||= WebDriverStatistics::Statistics.new
        end
      end
    end
  end
end