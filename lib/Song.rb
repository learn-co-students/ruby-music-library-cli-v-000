class Song
  extend Concerns::Findable
   attr_accessor :name, :artist, :genre

   @@all = []

   def initialize(name, artist="", genre="")
     @name = name
     if !(artist == "")
      @artist = artist
      @artist.add_song(self)
     end
     if !(genre == "")
      @genre = genre
      @genre.add_song(self)
     end
     self.save
   end

   def artist=(artist)
     @artist = artist
     @artist.add_song(self)
   end

   def genre=(genre)
     @genre = genre
     @genre.add_song(self)
   end

   def self.all
     @@all
   end

   def save
     @@all << self
   end

   def self.destroy_all
     @@all.clear
   end

   def self.create(name)
      self.new(name)
   end

   def self.new_from_filename(name)
     file1 = name.split(".mp3")
     file = []
     file << file1.collect do |file|
       file.split(" - ")
     end
     file = file.flatten
     song = Song.new(file[1])
     song.artist = Artist.find_or_create_by_name(file[0])
     song.genre = Genre.find_or_create_by_name(file[2])
     song
  end

  def self.create_from_filename(name)
    file1 = name.split(".mp3")
    file = []
    file << file1.collect do |file|
      file.split(" - ")
    end
    file = file.flatten
    song = Song.create(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
 end

end
