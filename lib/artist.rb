class Artist
  # include Concerns::Findable
  include Concerns::Findable
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
    Artist.new(name).save
    @@all.last
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.instance_variable_set(:@artist, self)
      unless @songs.include?(song)
        @songs << song
      end
    end
  end

  def genres
    genres = []
    @songs.select do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

  # def self.find_by_name(name)
  #   super
  # end

end
