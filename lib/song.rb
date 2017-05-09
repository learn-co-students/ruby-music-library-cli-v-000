class Song
   extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize (name, artist= nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

   def self.all
   @@all
   end

   def self.destroy_all
     @@all.clear
   end

   def save
     @@all << self
   end

   def self.create(name)
     song = self.new(name)
     song.save
     song
   end

   def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

   def genre=(genre)
     @genre = genre
     genre.add_song(self)
   end

   def self.new_from_filename(filename)
      filename_arr = filename.split(" - ")
      artist_name = filename_arr[0]
      song_name = filename_arr[1]
      genre_name = filename_arr[2].split(".")[0]

      song = self.new(song_name)
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(song)
      genre = Genre.find_or_create_by_name(genre_name)
      genre.add_song(song)
      song
    end
    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
  end
end
