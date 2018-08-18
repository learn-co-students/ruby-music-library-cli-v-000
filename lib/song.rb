
class Song
   extend Concerns::Findable
   @@all = []
  attr_accessor :name,:artist,:genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  # def self.find_by_name(name)
  #    self.all.detect { |song| song.name ==  name}
  # end
  # def self.find_or_create_by_name(name)
  #          song  = self.find_by_name(name)
  #         if song != nil
  #            return song
  #         else
  #              Song.create(name)
  #         end
  # end
   def self.new_from_filename(filename)
      artist, name, genre = filename.gsub(".mp3", "").split(" - ")
       #I cannot create directly song(name,artist,genre)bcos this way dont create the relationships between objects.
       song = self.new(name)
       #if artist exist assign artist, if not, i create artist and then do the assigment. Same for genre.

       song.artist = Artist.find_or_create_by_name(artist)
       song.genre =  Genre.find_or_create_by_name(genre)
       song
   end
   def self.create_from_filename(filename)
      self.new_from_filename(filename).save
      
   end
end
