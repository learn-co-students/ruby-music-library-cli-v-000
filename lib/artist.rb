class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.tap {|x| x.save}   
  end

  def save
    Artist.all << self
  end

  def add_song(new_song)
    self.songs << new_song if !self.songs.include? new_song
    new_song.artist = self if !new_song.artist
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

end