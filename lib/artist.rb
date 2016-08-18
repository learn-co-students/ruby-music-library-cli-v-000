class Artist

  extend Concerns::Findable



  attr_accessor :name, :song

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
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  def songs
    @songs
  end

  def artist
    artist.songs = self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist != self
    end

    def genres
      @songs.collect {|s| s.genre}.uniq
    end



end
