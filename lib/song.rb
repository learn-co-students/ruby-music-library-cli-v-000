 class Song
   require 'pry'
   extend Concerns::Findable
   attr_accessor :name
   attr_reader :artist,:genre
   @@all=[]
   def initialize(name, artist=nil, genre=nil)
     @name=name
     self.artist = artist if artist
     self.genre = genre if genre
   end

   def Song.all
     @@all
   end

   def Song.destroy_all
     @@all=[]
   end

   def save
     @@all<<self
   end

   def Song.create(name)
      newsong = new(name)
      newsong.save
      newsong
   end
   def artist=(artist)
    @artist = artist
    @artist.add_song(self)
   end

   def genre=(genre)

    @genre = genre
    if @genre.songs.include?(self)== false
      @genre.songs << self
    end
    genre
   end

   def Song.find_by_name(name)
     @@all.each do |searchsong|
       if searchsong.name == name
         return searchsong
       end
     end
     false
   end

   def Song.find_or_create_by_name(name)
      if self.find_by_name(name)
        return self.find_by_name(name)
      else
        newsong = Song.create(name)
        newsong
      end

   end

   def Song.new_from_filename(filename)

     splitparts = filename.split(" - ")
     artist_name, song_name, genre_name = splitparts[0], splitparts[1], splitparts[2].gsub(".mp3", "")
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)

     new(song_name, artist, genre)
   end

   def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save } #creates new song from filename and saves it
  end

 end
