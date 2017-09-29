module Findable
  
  module InstanceMethods
    
    def save
      self.class.all << self
    end
  end

  module ClassMethods

    def create(name)
      self.new(name)
    end

    def destroy_all
      self.all.clear
    end

    def list_by_name
      counter = 1
      stuff = []
      self.all.each do |i| 
        stuff << i
      end
      stuff.each do |p|
        artist = p.artist.name
        genre = p.genre.name
        puts "#{counter}. #{p.artist} - #{p.name} - #{p.genre}"
        counter += 1
        end 
    end
    


  end
end