module Findable



def find_by_name(name)
   self.all.detect{|a| a.name}
end

 # def self.find_by_name(name)
 #    @@all.detect {|song| name == song.name}
 #  end

def self.find_or_create_by_name(name)
    if #(@@all.detect {|song| name == song.name}) 
      self.all.find_by_name(name)== nil
      self.all.create(name)
    else 
      self.all.find_by_name(name)
    end
    
  end

















end