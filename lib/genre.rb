class Genre

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
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

  def artists
    @songs.map do |song|
    song.artist
    end
    .uniq
  end

  # def add_song(song)
  #   @genre = self unless song.genre
  #   # @genre << song unless songs.include?(song)
  # end



end
