module Concerns

  module Findable
    
    def find_by_name(name)
      self.all.each do |song|
        if song.name == name
          return song
        end
      end
    end

  end
end
