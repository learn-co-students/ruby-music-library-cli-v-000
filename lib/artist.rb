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

  def save
    @@all << self
  end

  def self.create(name)
    temp = self.new(name)
    @@all << temp
    temp
  end

  def add_song(song)
    @songs.each do |song2|
      if song == song2
        return song
      end
    end
    @songs << song
    song.artist = self
  end

  def genres
     self.songs.collect {|song| song.genre}.uniq
  end



end
