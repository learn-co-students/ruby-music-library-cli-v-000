class Genre

  extend Concerns::Findable # extend findable module 
  attr_accessor :name #The name property should be readable and writable by the object.
  attr_reader :songs

        @@all = [] #  each class should contain a class variable @@all that is set to an empty array

        def initialize(name) #they can accept a name upon initialization
          @name = name #and set that property correctly
        end



        def self.all #This class variable should be accessible via the class method .all.
          @@all
        end

        def self.destroy_all # The class should be able to empty its @@all
          all.clear
        end

        def save
          self.class.all << self #adds the instance itself into the appropriate @@all class variable.
        end

        def self.create(name) #should implement a custom constructor .create
            song = new(name) #that instantiates an instance using .new
            song.save #also invokes #save on that instance
            song #forcing it to persist immediately.
        end

        def artists
        songs.collect{ |s| s.artist }.uniq
        end

end # end genre class
