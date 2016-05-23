class Genre

  attr_accessor :name, :songs, :artists
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
      if song.genre == nil
        song.genre = self
      end
    end
  end

  def artists
    artist = songs.collect {|song| song.artist}
    artist.uniq
  end



end