class Song
 extend Concerns::Findable

 attr_accessor :name, :artist, :genre


 @@all = []

 def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist
   self.genre = genre
 end

 def artist=(value)
  @artist = value
    if @artist != nil
    artist.add_song(self)
    end
 end

 def genre=(value)
   @genre = value
   if @genre != nil && genre.songs.include?(self) == false
   genre.songs << self
  end
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

 def self.new_from_filename(filename)
  song_name = (filename.split(" - ")[1])
  artist_name = filename.split(" - ")[0]
  genre_name = filename.split(" - ")[2].gsub(".mp3", "")
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  self.new(song_name, artist, genre)
 end

 def self.create_from_filename(filename)
   song = self.new_from_filename(filename)
   song.save
 end

end
