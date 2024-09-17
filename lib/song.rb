class Song
  extend Concerns::Findable 
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    self.artist = artist
    self.genre = genre
    @name = name
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    song = self.new(name)
    song.save
  end

  def self.all
    @@all
  end 

  def self.destroy_all
    @@all.clear
  end

  def artist
    @artist 
  end

  def genre
    @genre
  end 

  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end 
  end 

  def genre=(genre)
    @genre = genre
    if genre != nil && !genre.songs.include?(self)
      genre.songs << self
    end 
  end

  def self.new_from_filename(filename)
    song_components = filename.match(/(.*) - (.*) - (.*)\./)

    name = song_components[2]
    artist = Artist.find_or_create_by_name(song_components[1])
    genre = Genre.find_or_create_by_name(song_components[3])

    Song.new(name, artist, genre)
  end

  def full_name
      "#{@artist.name} - #{@name} - #{@genre.name}"
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end