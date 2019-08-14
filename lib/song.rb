class Song
attr_accessor :name #The name property should be readable and writable by the object.
attr_reader :artist, :genre


  @@all = [] #  each class should contain a class variable @@all that is set to an empty array

      def initialize(name, artist = nil, genre = nil) #they can accept a name upon initialization
        @name = name #and set that property correctly
        self.artist = artist if artist
        self.genre = genre if genre
      end

        def artist=(artist)
          @artist = artist
          artist.add_song(self)
        end

        def genre=(genre)
          @genre = genre
          genre.songs << self unless genre.songs.include?(self)
        end


      def self.all # This class variable should be accessible via the class method .all.
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

      def self.find_by_name(name) # a method that uses the .all method defined by the class to find an instance of the class by name.
          all.detect{ |s| s.name == name }
        end

        def self.find_or_create_by_name(name) # a method to find an instance of the class by name and to create a new instance if a match is not found.
          find_by_name(name) || create(name)
        end

        def self.new_from_filename(filename) #instantiates a new Song object based on a provided filename.
          parts = filename.split(" - ")
          artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

          artist = Artist.find_or_create_by_name(artist_name)
          genre = Genre.find_or_create_by_name(genre_name)

          new(song_name, artist, genre)
        end

        def self.create_from_filename(filename) #ame thing as .new_from_filename but also saves the newly-created song to the @@all class variable.
          new_from_filename(filename).tap{ |s| s.save }
        end





end # end song class
