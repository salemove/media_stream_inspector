require "media_stream_inspector/version"

module MediaStreamInspector
  # Run tests with:
  #   rspec -I ./lib/salemove/testing ./spec/lib/salemove/testing/stream_inspector_spec.rb
  class InspectionReport
    def initialize(activity=false)
      @activity = activity
    end

    def was_active?
      @activity
    end
  end

  class StreamInspector
    TargetElementNotFound = Class.new(StandardError)

    def initialize(selector, page)
      @selector = selector
      @page = page
    end

    def detect_activity(duration=1)
      ensure_selector_exists
      measurement_id = @page.execute_script result_measurer % {duration: duration, selector: @selector}
      sleep duration + 0.1

      result_count = @page.execute_script results_reader % {measurement_id: measurement_id}
      InspectionReport.new(result_count.to_i > 0)
    end

    private

    def result_measurer
      read_js_snippet 'measurer'
    end

    def results_reader
      read_js_snippet 'results_reader'
    end

    def read_js_snippet(file_name)
      File.open("#{File.dirname(__FILE__)}/snippets/#{file_name}.js", 'rb') { |f| f.read}
    end

    def ensure_selector_exists
      @page.find(@selector)
    rescue Capybara::ElementNotFound
      raise TargetElementNotFound
    end

  end
end
