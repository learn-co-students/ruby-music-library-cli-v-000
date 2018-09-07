class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
      song = Artist.new(name)
      song.save
      song
  end

  def add_song(song)
    if songs.include?(song) == false
    @songs << song
    end
    # only set the artist of the song if it's blank
    # note, without this it creates an infinite loop between song.artist= and artist.add_song
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    array = []
    songs.each do |song|
      array << song.genre
    end
    array.uniq
  end

end
