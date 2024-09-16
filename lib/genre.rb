class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  #ClassMethods

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  #InstanceMethods
  def save
    @@all << self
  end

  def add_song(song)
    if @songs.include?(song)
      @songs
    else
      @songs << song
      if song.genre.nil?
        song.genre = self
      end
    end
  end

  def artists
    artists = self.songs.collect {|song|
      song.artist
    }
    artists.uniq
  end

end
