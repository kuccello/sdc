module SDC
  class GenericResponse
    
    def initialize(response)
      
      h = Hashie::Mash.new(response["GenericResponse"])     
      
      SDC.map_mash_attrs(self, h)    
      
      @server_detail = ServerDetail.new(self.server_detail)  
    end
  end
end
