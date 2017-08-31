class Genre

  extend Concerns::Findable

#  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def artists
    array = []
    self.songs.each do |song|
      if !array.find {|previous| song.artist == previous}
        array << song.artist
      end
    end
    array
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

end
