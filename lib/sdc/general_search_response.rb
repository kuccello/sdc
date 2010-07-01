module SDC
  class GeneralSearchResponse

    def initialize(response)
      
      puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{response.inspect}"
      h = Hashie::Mash.new(response["GeneralSearchResponse"])
      puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{h.inspect}"

      SDC.map_mash_attrs(self, h)
#      puts "#{__FILE__}:#{__LINE__} [#{__method__}] #{self.inspect}"

      if self.respond_to?(:categories, true) then
        if self.categories.category.is_a?(Array)
          @categories = self.categories.category.map { |category| Category.new(category) }
        else
          @categories = [Category.new(self.categories.category)]
        end
      end

      if self.respond_to?(:exceptions, true) then
        if self.exceptions.exception.is_a?(Array)
          @exceptions = self.exceptions.exception.map { |exception| APIException.new(exception) }
        else
          @exceptions = [APIException.new(self.exceptions.exception)]
        end
      end

      @server_detail = self.respond_to?(:server_detail, true) ? ServerDetail.new(self.server_detail) : nil
      @client_tracking = self.respond_to?(:client_tracking, true) ? ClientTracking.new(self.client_tracking) : nil
      @related_terms = self.respond_to?(:related_terms, true) ? (self.related_terms ? self.related_terms.term : []) : nil
      @search_history = self.respond_to?(:search_history, true) ? SearchHistory.new(self.search_history) : nil
    end

  end
end
