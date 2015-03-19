module WebDriverStatistics

  class Statistics

    COMMANDS = [:newSession, :status, :get, :getCapabilities, :implicitlyWait, :setScriptTimeout, :setTimeout,
                :getAlert, :acceptAlert, :dismissAlert, :setAlertValue, :getAlertText, :goBack, :goForward, :getCurrentUrl,
                :getTitle, :getPageSource, :getVisible, :setVisible, :switchToWindow, :switchToFrame, :switchToParentFrame,
                :quit, :close, :refresh, :getWindowHandles, :getCurrentWindowHandle, :setWindowSize, :maximizeWindow,
                :getWindowSize, :setWindowPosition, :getWindowPosition, :screenshot, :getLocalStorageItem, :removeLocalStorageItem,
                :getLocalStorageKeys, :setLocalStorageItem, :clearLocalStorage, :getLocalStorageSize, :getSessionStorageItem,
                :removeSessionStorageItem, :getSessionStorageKeys, :setSessionStorageItem, :clearSessionStorage,
                :getSessionStorageSize, :getLocation, :setLocation, :isBrowserOnline, :setBrowserOnline, :executeScript,
                :executeAsyncScript, :addCookie, :deleteCookie, :getCookies, :deleteAllCookies, :clickElement, :click,
                :doubleClick, :mouseDown, :mouseUp, :mouseMoveTo, :sendKeysToActiveElement, :sendKeysToElement, :uploadFile,
                :clearElement, :submitElement, :dragElement, :touchSingleTap, :touchDoubleTap, :touchLongPress, :touchDown,
                :touchUp, :touchMove, :touchScroll, :touchFlick, :setScreenOrientation, :getScreenOrientation,
                :getAvailableLogTypes, :getLog, :getElementTagName, :getElementAttribute, :getElementValue, :getElementText,
                :getElementLocation, :getElementLocationOnceScrolledIntoView, :getElementSize, :isElementEnabled,
                :isElementSelected, :isElementDisplayed, :getElementValueOfCssProperty, :elementEquals, :getActiveElement,
                :findChildElement, :findElement, :findChildElements, :findElements]

    attr_accessor :commands
    attr_reader :total_executions

    def initialize
      @commands = {}
      @total_executions = 0
    end

    COMMANDS.each do |command|
      define_method(command) do |exception=nil|
        @commands[command] ||= {}

        if exception.nil?
          @commands[command][:passed] ||= 0
          @commands[command][:passed] += 1
        else
          @commands[command][exception] ||= 0
          @commands[command][exception] += 1
        end

        @total_executions += 1
      end
    end

    def log(string)
      puts string if ENV['SE_DEBUG'] == true
    end

    def to_s
      "\nExecuted #{@total_executions} Total Commands\n#{command_string}"
    end

    private

    def command_string
      @commands.keys.sort.each_with_object('') do |command, str|
        @commands[command].keys.each do |result|
          str << "\t#{command} - #{@commands[command][result]} times with result #{result}\n"
        end
      end
    end

  end
end
