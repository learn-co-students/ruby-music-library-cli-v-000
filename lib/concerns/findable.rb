#findable module in /config/environment.rb


module Concerns
  module Findable
    def create(objectName)
      object = self.new(objectName)
      object.save
      object
    end
    
    def find_by_name(objectName)
      self.all.find {|object| object.name == objectName }
    end
    
    def find_or_create_by_name(objectName)
      self.find_by_name(objectName) ? self.find_by_name(objectName) : self.create(objectName)
    end
    
      # def self.create(song)
  #   song = self.new(song)
  # end
  
  # def self.find_by_name(songName)
  #   self.all.find {|song| song.name == songName }
  # end
    
  # def self.find_or_create_by_name(songName)
  #   self.find_by_name(songName) ? self.find_by_name(songName) : self.create(songName)
  # end
  
  end
end