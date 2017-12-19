module Concerns 
  
  module Findable 
      
    def find_by_name(name) # class method
      # searches the extended class' @@all array for an instance that matches the provided name 
       self.all.find do |item|
        item.name == name   
    end 
    end

    def find_or_create_by_name(name)
      # class method
      # finds an existing instance with the name provided if one exists in @@all array
      # returns a song existence with name if one exists in @@all array
      self.find_by_name(name) || self.create(name)
    end 
  
    def create(name)
    # - this will initialize a new song and save the song in the @@all array 
      song = Song.new(name)
      self.all << song
      song
    end
    
  end
  
#  extend Findable::ClassMethods
#  include Memorable::InstanceMethods
#  
#  extend Findable 
#  
#  include Paramable
#  
   
end 