class Artist
  attr_accessor :name
  @@all = []
  extend Concerns::Findable
  def initialize(name)
    @name=name
    @songs = []
    @song_count = 0
  end
  def add_song(song)
    unless song.artist != nil
      song.artist = self
    end
    if @songs.include?(song)
      song.artist
    else
      @songs << song
      song.artist=self
      @song_count +=1
    end
  end
  def songs
    @songs
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    if
      @@all.collect do |artist|
        artist.name
      end.include?(self.name)
      @@all
    else
      @@all << self
    end
  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
