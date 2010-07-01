module SDC
  class ConsumerReview
    
    attr_accessor :featured_ratings
    
    def initialize(cat_mash)   
      SDC.map_mash_attrs(self, cat_mash)
            
      @rating = self.rating.overallRating
    end
    
  end
end
