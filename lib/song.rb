class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    @@all = []
    self.artist = artist if artist
    #binding.pry
    self.genre = genre if genre
  end

  def artist=(artist)
    #binding.pry
    @artist = artist
    artist.add_song(self)
    #if(artist != nil)
      #Artist.find_or_create_by_name(artist).add_song(self)
      #artist.add_song(self)
    #end
  end

  def self.new_from_filename(filename)
    songname = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(songname[0])
    genre = Genre.find_or_create_by_name(songname[2])
    Song.new(songname[1], artist, genre)

  end

  def self.create_from_filename(filename)
     self.new_from_filename(filename).save
  end

  def genre=(genre)
    @genre = genre
    if(genre != nil) && (!genre.songs.include?(self))
        genre.songs << self
      end
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
