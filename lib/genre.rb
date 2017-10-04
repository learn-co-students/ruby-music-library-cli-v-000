class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def artists
    temp_array = []
    @songs.each do |song|
      if !temp_array.include?(song.artist)
        temp_array << song.artist
      end
    end
    temp_array
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_song = Genre.new(name)
  end

end
