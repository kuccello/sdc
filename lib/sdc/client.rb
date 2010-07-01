module SDC
  class Client

    attr_accessor :api_key, :tracking_id, :sandbox

    def initialize(api_key,tracking_id,sandbox=false)
      @api_key = api_key
      @tracking_id = tracking_id
      @sandbox = sandbox
    end

    # TODO -- turn the request_type values into class constants
    def respond(request_type='', options={})
      opts = {'apiKey' => @api_key, 'trackingId' => @tracking_id}
      options.each do |key, value|
        opts[key.to_s.camelize(:lower)] = value
      end

#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{opts.inspect}"

      base_url = (@sandbox ? 'http://sandbox.api.shopping.com/publisher/3.0/rest' : 'http://publisher.usb.api.shopping.com/publisher/3.0/rest')
      target_url = "#{base_url}/#{request_type}"

#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] Target URL: #{target_url}"

      response = HTTParty.get(target_url, :query=>opts)
#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{response.inspect}"

      target_key = ''
      response.parsed_response.each_key do |key|
#        puts "#{__FILE__}:#{__LINE__} [#{__method__}] KEY: #{key}"
        target_key = key
      end

      # now we decide what kind of response object gets returned
      # invoke the correct constructor based on the value of target_key
      response_class = SDC.const_get("#{target_key}")
#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] FOO: #{response_class.class.name}"
#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] FOO: #{response_class.new(response)}"


      response_class.new(response)
    end
  end
end
