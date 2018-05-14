require 'pry'
class Song
    attr_accessor  :name
    attr_reader :artist, :genre
    @@all = [ ]

  def initialize(name, artist = nil, genre = nil)
      @name = name
      if artist != nil
        self.artist = artist #call the method on line 34
      end
        if genre != nil
          self.genre = genre
        end
    end

    def save
      @@all << self  # refers to the class artist
    end

    def self.all # show all song artist ever created.
      @@all
    end

    def self.destroy_all
      @@all.clear

    end

    def self.create(name) # create a new song
         song = Song.new(name)
         song.save
         song
    end

    def artist=(artist)  #manual assign song
       @artist = artist  #artist is in attr_accessor
       artist.add_song(self)  #manually add artist to song

    end

    def genre=(genre)
      # binding.pry
       @genre = genre
       genre.add_song(self)
    end

      def self.find_by_name(name)
           self.all.find {|x| x.name == name}
           binding.pry
      end


      def self.create(name)
            song = self.new(name) #initiate new artist.
            song.save  #reason for the save method
            song
      end

      def self.find_or_create_by_name(name)
        #turn class string into an objects
        # This is where we chain things togther
         if self.find_by_name(name)
            self.find_by_name(name)
         else
           self.create(name)
         end
       end

       def self.new_from_filename(file_name)

            art_name = file_name.split(" - ")[0]
            song_name = file_name.split(" - ")[1]
            genre_name = file_name.split(" - ")[2].gsub(".mp3","")
            #  look for what file_name gives,  then split on that.
            # targeting the songs which is the 2nd element in the array
             artist = Artist.find_or_create_by_name(art_name)
             genre = Genre.find_or_create_by_name(genre_name)
             new_song = self.new(song_name, artist, genre)
             new_song
       end

       def self.create_from_filename(file_name)
           self.new_from_filename(file_name).save

       end
  end
