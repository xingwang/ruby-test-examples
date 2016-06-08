require 'rest-client'

class TestExamples
  def initialize master_splinter
    @api_url = "http://api.census.gov/data/2014/acs1/variables.json"
    @master_splinter = master_splinter
  end

  def go_ninja_go_ninja_go test_payload
    begin
      actual_payload = RestClient.get @api_url, {:accept => :json}
      if (actual_payload && actual_payload.code == 200)
        puts "Acquired actual payload."
        @master_splinter.made_a_funny actual_payload
      else
        puts "API returned a non-200 status code. Using test payload instead."
        @master_splinter.made_a_funny test_payload
      end
    rescue RestClient::Exception => e
      puts "API returned an error status code. Using test payload instead."
      @master_splinter.made_a_funny test_payload
    rescue Exception => e
      $stderr.puts "Unexpected error: #{e.backtrace}"
      raise e
    end
  end
end
