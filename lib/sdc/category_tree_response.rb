module SDC
  class CategoryTreeResponse

    def initialize(response)
      
      h = Hashie::Mash.new(response["CategoryTreeResponse"])     

      SDC.map_mash_attrs(self, h)
puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{self.inspect}"
      
      if self.category.categories.is_a?(Array)
        @categories = self.category.categories.map { |category| Category.new(category) }
      else
        @categories = [Category.new(self.category.categories)]
      end

      if self.respond_to?(:exceptions, true) then
        if self.exceptions.exception.is_a?(Array)
          @exceptions = self.exceptions.exception.map { |exception| APIException.new(exception) }
        else
          @exceptions = [APIException.new(self.exceptions.exception)]
        end
      end

      @server_detail = ServerDetail.new(self.server_detail)
      @client_tracking = ClientTracking.new(self.client_tracking) if self.respond_to?(:client_tracking)
      
    end
  end
end
