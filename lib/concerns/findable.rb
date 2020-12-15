 #modules methods only and no self, no instances created
  module Concerns::Findable
     #finds a object  instance in @@all by the name property of the song
    def find_by_name(name) #iterates over @@all to check for matching song names
      self.all.find { |object| object.name == name } #checking each song objects name attr in array
    end         #|object| :give access to each element one at a time in the array
                #object.name :gives access to the name attr of every song object in array
                #== name :then compares the accessed info to the name arg passed in

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
