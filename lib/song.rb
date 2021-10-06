require "pry"
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize (name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    @@all << self
  end

  def artist= (artist)
    # Note: if artist is already set, we should tell that artist to forget this song
    # For mp3 importer, this should not matter but if Song class was re-used in
    # other apps, this could lead to a mess
    @artist=artist
    artist.add_song(self) if artist!=nil
  end

  def artist_name= (artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    self.artist= artist
  end

  def genre= (genre)
    @genre=genre
    genre.add_song(self) if genre!=nil
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end

  def self.create (name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename (filename)
    #filename format is artist - title - genre.mp3
  #  params = filename.split(/[-.]+/)
    params = filename.split(/\s{1}-\s{1}+/)
    params.map! { | param | param.strip }

    # get objects
    song = find_or_create_by_name(params[1])
    genre = Genre.find_or_create_by_name(params[2].chomp(".mp3"))

    # create relationships
    song.genre = genre
    song.artist_name = params[0]
    song
  end

  def self.create_from_filename (filename)
    Song.new_from_filename(filename)
  end

  #NOTE: these can be removed by adding extend Concerns:Findable
  def self.find_by_name (name)
    @@all.detect { | song | song.name == name }
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create(name)
  end
end
