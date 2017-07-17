class Song
   extend Concerns::Findable
   attr_accessor :name, :artist, :genre
   @@all = []

   def initialize(name, artist = nil, genre = nil)
     @name = name

     if artist
       self.artist = artist
     end
     if genre
       self.genre = genre
     end
   end

   def save
     @@all << self
   end

   def self.all
     @@all
   end

   def self.destroy_all
     self.all.clear
   end

   def self.create(name)
     song = Song.new(name)
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
    clean_filename = filename.gsub(".mp3", "")
    song_name = clean_filename.split(" - ")[1]
    song = Song.new(song_name)
    artist_name = clean_filename.split(" - ")[0]
    song.artist_name = artist_name
    genre_name = clean_filename.split(" - ")[2]
    song.genre_name = genre_name
    song
   end

   def artist_name=(artist_name)
     self.artist = Artist.find_or_create_by_name(artist_name)
     artist.add_song(self)
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(self)
  end

   def self.create_from_filename(filename)
     new_song = self.new_from_filename(filename)
     new_song.save
   end

 end
