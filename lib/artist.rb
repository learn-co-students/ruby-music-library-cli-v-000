class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @songs = []
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song)

      if !self.songs.include?(song) && song.artist == "nil"
        song.artist = self
        self.songs << song
      elsif !self.songs.include?(song) && song.artist != "nil"
          self.songs << song
      else puts "song is already in this artist's songs array"
      end

  end

end
