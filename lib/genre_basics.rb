class Genre

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

  def self.create(genre) #maybe syntactically better to call #name
    genre = Genre.new(genre)
    genre.save
    genre

    #new(name).tap{|a| a.save}
  end

  def songs
    @songs
  end

  def artists
    artist_array = self.songs.collect {|song| song.artist}
    artist_array.uniq

    #more concise
    #self.songs.collect{|s| s.artist}.uniq
  end

end
