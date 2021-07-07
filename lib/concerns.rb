module Concerns
  
  module Findable 
  
    def find_by_name(findsong)
        @songname = nil
        self.all.each do |song|
          if song.name == findsong
          @songname = song
          end
        end
      @songname
    end
   
    def find_or_create_by_name(findsong)
      if self.find_by_name(findsong) == nil 
        self.create(findsong)
      else 
        self.find_by_name(findsong) 
      end
    end
  
  end 
  



end