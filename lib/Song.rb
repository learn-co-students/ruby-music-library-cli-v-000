class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []
  def initialize(name,artist = nil, genre = nil)
    @name = name
    @@all << self
    if artist != nil
      artist.add_song(self)
    end
    @artist = artist
    if genre != nil
      genre.add_song(self)
    end
    @genre = genre
  end



 def genre=(genre)
   @genre=genre
   if genre != nil
   genre.add_song(self)
   end
 end

 def artist=(artist)
   @artist = artist
   if artist != nil
   artist.add_song(self)
   end
 end


  def self.all
  @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
end
end
