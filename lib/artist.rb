class Artist

  attr_accessor :name, :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs =[]
  end

  def save
    @@all << self
  end

  def add_song(song)
    if self.songs.include?(song) == false
      @songs << song
    end
    if song.artist.nil?
      song.artist = self
    end
  end

  def genres
    genre_list = self.songs.collect do |song|
      song.genre
    end
    genre_list.uniq!
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end


end
