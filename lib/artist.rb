class Artist

  attr_accessor :name, :song
  @@all = []

  def initialize(name, artist=nil)
      @name = name
      @song = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end

    def genres
      @songs.collect { |song| song.genre}.uniq
    end

end
