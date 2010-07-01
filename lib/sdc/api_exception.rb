module SDC
  class APIException  
          
    def initialize(cat_mash)        
      SDC.map_mash_attrs(self, cat_mash)
    end
    
  end
end
