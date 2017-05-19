class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs, :song

    @@all = []

  def initialize(name, song=nil)
    @name = name
    @songs = []
    # @song = song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    unique = []
    @songs.each do |e|
      if !unique.include?(e.artist)
        unique << e.artist
      end
    end
    unique
  end

end
