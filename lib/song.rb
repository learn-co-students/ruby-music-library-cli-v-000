class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    @@all = []
    self.artist = artist
    self.genre = genre
  end

  def self.new_from_file_name(filename)
    self.new(file_name.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.artist.add_song(self)
    self
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


  def artist=(artist)
    @artist = artist
    if(artist != nil)
      artist.add_song(self)
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
