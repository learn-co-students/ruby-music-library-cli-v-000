class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    #binding.pry
    self.name = name
    self.songs = []
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def genres
    unique = []
    songs.map do |song|
      if(!unique.include?(song.genre))
        unique << song.genre
      end
    end
    unique
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end



  def add_song(song)
    if(song.artist == nil)
      song.artist = self
    end
    if (!self.songs.include?(song))
        self.songs << song
      end
  end


end
