class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre.save
    genre
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def artists
    song_array = []
    @songs.collect do |song|
      song.artist
      song_array << song.artist
    end
    song_array.uniq
  end
end