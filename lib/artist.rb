class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] # Quinn: Added this back in
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


  def add_song(song)
    if @songs.include?(song)
      return
    end
    @songs << song
    song.artist = self unless song.artist == self
  end


  def genres
    all_genres = songs.collect { |a_song| a_song.genre }
    all_genres.uniq
  end


end
