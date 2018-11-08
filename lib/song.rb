require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []
  #(song belongs to artist)
  #(song belongs to genre)
  def initialize(name, artist = nil, genre = nil)
    # if artist != nil
      self.artist = artist if artist
    # end
    # if genre != nil
    self.genre = genre if genre
    # end
    @name = name
    # if self.artist = artist

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    # binding.pry
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
     @genre = genre
     if @genre.songs.include?(self) != true
       @genre.songs << self
    end
  end

  def Song.find_by_name(name)
    #binding.pry
    @@all.find{|song|song.name == name}
  end

  def Song.find_or_create_by_name(name)
    #binding.pry
   Song.find_by_name(name) || Song.create(name)

  end

end
